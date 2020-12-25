import 'package:weather_monitor/api/weather_api.dart';
import 'package:weather_monitor/model/weather.dart';

class WeatherService {
  final WeatherApi weatherApi;
  WeatherService(this.weatherApi);

  Future<CurrentWeather> getCurrentWeather(String city) async {
    return await weatherApi.getCurrentWeather(city);
  }

  Future<ForecastStat> getForecastWeather(String city) async {
    return await weatherApi.getForecastWeather(city);
  }
}