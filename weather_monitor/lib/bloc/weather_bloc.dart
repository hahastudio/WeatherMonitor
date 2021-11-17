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
    } else if (event is WeatherBackgroundRefreshRequested) {
      yield* _mapWeatherBackgroundRefreshRequestedToState(event);
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
      yield WeatherLoadSuccess(weather: weather);
    } catch (e) {
      print(e);
      yield WeatherLoadFailure(errorMessage: e.toString(), city: event.city);
      // TODO: Show error message but not flush current result
    }
  }

  Stream<WeatherState> _mapWeatherBackgroundRefreshRequestedToState(WeatherBackgroundRefreshRequested event) async* {
    yield WeatherLoadInProgress();
    await Future.delayed(Duration(seconds: 1));
    yield* _mapWeatherInitiatedToState(WeatherInitiated(city: event.city));
  }
}
