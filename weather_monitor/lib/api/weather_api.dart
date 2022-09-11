import 'package:weather_monitor/model/models.dart';

abstract class WeatherApi {
  Future<OverAllWeather> getOverAllWeather(Location location);
  Future<CurrentWeather> getCurrentWeather(String city);
  Future<ForecastStat> getForecastWeather(String city);
  Future<Location> getLocation(String city);
}