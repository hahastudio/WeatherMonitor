import 'dart:convert';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/bloc/blocs.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/repository/repositories.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial()) {
    on<WeatherInitiated>(_onWeatherInitiated);
    on<WeatherRequested>(_onWeatherRequested);
    on<WeatherRefreshRequested>(_onWeatherRefreshRequested);
    on<WeatherBackgroundRefreshRequested>(_onWeatherBackgroundRefreshRequested);
  }

  Future _onWeatherInitiated(WeatherInitiated event, Emitter<WeatherState> emit) async {
    final SharedPreferences prefs = await _prefs;
    String weatherJson = prefs.getString('weather') ?? '';

    if (weatherJson != '' && weatherJson != '{}') {
      try {
        Map weatherMap = json.decode(weatherJson);
        OverAllWeather weather = OverAllWeather.fromJson(weatherMap);
        emit(WeatherLoadSuccess(weather: weather));
      } catch (e) {
        print(e);
        await _onWeatherRequested(WeatherRequested(city: event.city), emit);
      }
    } else {
      await _onWeatherRequested(WeatherRequested(city: event.city), emit);
    }
  }

  Future _onWeatherRequested(WeatherRequested event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadInProgress());
    await _onWeatherRefreshRequested(WeatherRefreshRequested(city: event.city), emit);
  }

  Future _onWeatherRefreshRequested(WeatherRefreshRequested event, Emitter<WeatherState> emit) async {
    try {
      final OverAllWeather weather = await weatherRepository.getOverAllWeather(event.city);
      emit(WeatherLoadSuccess(weather: weather));
    } catch (e) {
      print(e);
      emit(WeatherLoadFailure(errorMessage: e.toString(), city: event.city));
      // TODO: Show error message but not flush current result
    }
  }

  Future _onWeatherBackgroundRefreshRequested(WeatherBackgroundRefreshRequested event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadInProgress());
    await Future.delayed(Duration(seconds: 1));
    await _onWeatherInitiated(WeatherInitiated(city: event.city), emit);
  }
}
