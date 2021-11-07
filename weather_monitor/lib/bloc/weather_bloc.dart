import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/bloc/blocs.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/notification_service.dart';
import 'package:weather_monitor/repository/repositories.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherInitiated) {
      yield* _mapWeatherInitiatedToState(event);
    } else if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherInitiatedToState(WeatherInitiated event) async* {
    final SharedPreferences prefs = await _prefs;
    String weatherJson = prefs.getString('weather') ?? '';

    if (weatherJson != '' && weatherJson != '{}') {
      try {
        Map weatherMap = json.decode(weatherJson);
        OverAllWeather weather = OverAllWeather.fromJson(weatherMap);
        yield WeatherLoadSuccess(weather: weather);
      } catch (e) {
        print(e);
        yield* _mapWeatherRequestedToState(WeatherRequested(city: event.city));
      }
    } else {
      yield* _mapWeatherRequestedToState(WeatherRequested(city: event.city));
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(WeatherRequested event) async* {
    yield WeatherLoadInProgress();
    yield* _mapWeatherRefreshRequestedToState(WeatherRefreshRequested(city: event.city));
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(WeatherRefreshRequested event) async* {
    try {
      final OverAllWeather weather = await weatherRepository.getOverAllWeather(event.city);
      if (weather != null) {
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('weather', jsonEncode(weather.toJson()));
        if ((weather.alerts != null) && (weather.alerts.length > 0)) {
          List<String> alertJsons = prefs.getStringList('weatherAlerts');
          List<WeatherAlert> alertsSaved = [];
          if ((alertJsons != null) && (alertJsons.length > 0)) {
            for (final alertJson in alertJsons) {
              if (alertJson != null) {
                Map alertMap = json.decode(alertJson);
                alertsSaved.add(WeatherAlert.fromJson(alertMap));
              }
            }
          }

          List<WeatherAlert> alertsToSend = [];
          for (final weatherAlert in weather.alerts) {
            if (!alertsSaved.any((element) => element.id == weatherAlert.id)) {
              alertsToSend.add(weatherAlert);
            }
          }
          if (alertsToSend.length > 0)
            NotificationService().sendWeatherAlertNotification(alertsToSend, weather.city);

          List<WeatherAlert> alertsToSave = alertsSaved + alertsToSend;
          alertsToSave.removeWhere((element) => element.start.isBefore(DateTime.now().add(Duration(days: -7))));
          List<String> alertsToSaveJsons = alertsToSave.map((element) => jsonEncode(element.toJson())).toList();
          await prefs.setStringList('weatherAlerts', alertsToSaveJsons);
        }
      }
      yield WeatherLoadSuccess(weather: weather);
    } catch (e) {
      print(e);
      yield WeatherLoadFailure(errorMessage: e.toString(), city: event.city);
      // TODO: Show error message but not flush current result
    }
  }
}
