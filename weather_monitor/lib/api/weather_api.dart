import 'package:weather_monitor/model/weather.dart';

abstract class WeatherApi {
  Future<OverAllWeather> getWeather(Location location);
  Future<Location> getLocation(String city);
}