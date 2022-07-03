import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/bloc/blocs.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/util/constants.dart';
import 'package:weather_monitor/widget/widgets.dart';

import '../location_service.dart';


class WeatherWidget extends StatefulWidget {
  State<WeatherWidget> createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends State<WeatherWidget> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
    loadPrefs();
  }

  void loadPrefs() async {
    final SharedPreferences prefs = await _prefs;

    // city
    String city = prefs.getString(Constants.CitySettingKey) ?? '';

    if (city != '')
      BlocProvider.of<WeatherBloc>(context)
          .add(WeatherInitiated(city: city));
    // theme
    int themeMode = Settings.getValue<int>('settings.themeMode', defaultValue: 0);
    BlocProvider.of<ThemeBloc>(context)
        .add(ThemeEvent(appTheme: AppTheme.values[themeMode]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Monitor'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (_) => SettingsListWidget(),
              ));
            },
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if ((state is WeatherLoadSuccess) || (state is WeatherLoadFailure)) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return WeatherInitWidget();
            }
            if (state is WeatherLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadSuccess) {
              final weather = state.weather;
              print('weather updated on ${weather.current.dt} will be rendered.');

              return RefreshIndicator(
                onRefresh: () {
                  BlocProvider.of<WeatherBloc>(context).add(
                    WeatherRefreshRequested(city: weather.city),
                  );
                  return _refreshCompleter.future;
                },
                child: ListView(
                  children: <Widget>[
                    LastUpdatedWidget(lastUpdatedOn: weather.current.dt),
                    SizedBox(height: 5),
                    LocationWidget(
                      longitude: weather.longitude,
                      latitude: weather.latitude,
                      city: weather.city,
                    ),
                    SizedBox(height: 50),
                    WeatherSummaryWidget(
                      condition: weather.current.weather,
                      temp: weather.current.temp.celsius,
                      feelsLike: weather.current.feelsLike.celsius,
                      description: weather.description,
                    ),
                    ConditionalWidget(
                      condition: (weather.alerts != null) && (weather.alerts.length > 0),
                      widgetBuilder: (context) => WeatherAlertsWidget(alerts: weather.alerts),
                    ),
                    SizedBox(height: 10),
                    WeatherDetailsWidget(weather: weather.current),
                    Padding(
                      child: Divider(
                          color: Theme.of(context).textTheme.bodyText2.color
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    ForecastHourlyHorizontalWidget(
                      weathers: weather.hourly,
                    ),
                    Padding(
                      child: Divider(
                          color: Theme.of(context).textTheme.bodyText2.color
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    ForecastDailyHorizontalWidget(
                      weathers: weather.daily,
                    ),
                    Padding(
                      child: Divider(
                          color: Theme.of(context).textTheme.bodyText2.color
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    TemperatureLineChart(
                      weather.hourly,
                      animate: true,
                    ),
                    Padding(
                      child: Divider(
                          color: Theme.of(context).textTheme.bodyText2.color
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    RainLineChart(
                      weather.hourly,
                      animate: true,
                    ),
                    Padding(
                      child: Divider(
                          color: Theme.of(context).textTheme.bodyText2.color
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    WindLineChart(
                      weather.hourly,
                      animate: true,
                    ),
                    Padding(
                      child: Divider(
                          color: Theme.of(context).textTheme.bodyText2.color
                      ),
                      padding: EdgeInsets.all(10),
                    ),
                    WindMapWidget(Location(latitude: weather.latitude, longitude: weather.longitude))
                  ],
                ),
              );
            }
            if (state is WeatherLoadFailure) {
              final String errorMessage = state.errorMessage;
              final String city = state.city;
              return RefreshIndicator(
                onRefresh: () {
                  BlocProvider.of<WeatherBloc>(context).add(
                    WeatherRefreshRequested(city: city),
                  );
                  return _refreshCompleter.future;
                },
                child: ListView(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 100, horizontal: 10),
                      child: Text(
                        'Something went wrong!\n' + errorMessage,
                        style: TextStyle(
                          color: Theme.of(context).errorColor,
                        ),
                        softWrap: true,
                      ),
                    )
                  ],
                ),
              );
            }
            return EmptyWidget();
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.search),
        onPressed: () async {
          final city = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CitySelectionWidget(),
            ),
          );
          if (city != null) {
            if (city.startsWith(Constants.GpsPrefix)) {
              await LocationService().init();
            }
            if (await WeatherBloc.IsInitialized()) {
              BlocProvider.of<WeatherBloc>(context)
                  .add(WeatherRequested(city: city));
            }
          }
        },
      ),
    );
  }
}
