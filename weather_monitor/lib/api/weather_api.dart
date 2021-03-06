import 'package:weather_monitor/model/models.dart';

abstract class WeatherApi {
  Future<Location> getLocation(String city);
  Future<OverAllWeather> getOverAllWeather(Location location);
  Future<CurrentWeather> getCurrentWeather(String city);
  Future<ForecastStat> getForecastWeather(String city);
}