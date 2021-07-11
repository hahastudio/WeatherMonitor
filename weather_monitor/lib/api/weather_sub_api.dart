import 'package:weather_monitor/model/models.dart';

abstract class WeatherSubApi {
  Future<OverAllWeather> getOverAllWeather(Location location);
}