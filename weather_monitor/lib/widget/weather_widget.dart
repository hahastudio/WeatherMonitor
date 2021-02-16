import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/bloc/blocs.dart';
import 'package:weather_monitor/widget/widgets.dart';


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
    String city = prefs.getString('city') ?? '';

    if (city != null && city != '')
      BlocProvider.of<WeatherBloc>(context)
          .add(WeatherRequested(city: city));
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
            },
          )
        ],
      ),
      body: Center(
        child: BlocConsumer<WeatherBloc, WeatherState>(
          listener: (context, state) {
            if (state is WeatherLoadSuccess) {
              _refreshCompleter?.complete();
              _refreshCompleter = Completer();
            }
          },
          builder: (context, state) {
            if (state is WeatherInitial) {
              return Center(child: Text('Please Select a Location'));
            }
            if (state is WeatherLoadInProgress) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is WeatherLoadSuccess) {
              final weather = state.weather;

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
                    ),
                    SizedBox(height: 20),
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
                    )
                  ],
                ),
              );
            }
            if (state is WeatherLoadFailure) {
              return Text(
                'Something went wrong!',
                style: TextStyle(color: Theme.of(context).errorColor),
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
            BlocProvider.of<WeatherBloc>(context)
                .add(WeatherRequested(city: city));
          }
        },
      ),
    );
  }
}
