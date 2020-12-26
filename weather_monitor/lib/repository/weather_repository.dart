import 'package:weather_monitor/api/apis.dart';
import 'package:weather_monitor/model/models.dart';

class WeatherRepository {
  final WeatherApi weatherApi;
  WeatherRepository(this.weatherApi);

  Future<OverAllWeather> getOverAllWeather(String city) async {
    var location = await weatherApi.getLocation(city);
    var weather = await weatherApi.getOverAllWeather(location);
    weather.city = city;
    return weather;
  }

  Future<CurrentWeather> getCurrentWeather(String city) async {
    return await weatherApi.getCurrentWeather(city);
  }

  Future<ForecastStat> getForecastWeather(String city) async {
    return await weatherApi.getForecastWeather(city);
  }
}