import 'package:weather_monitor/api/apis.dart';
import 'package:weather_monitor/model/models.dart';

class WeatherRepository {
  final WeatherApi weatherApi;
  final WeatherSubApi weatherSubApi;
  WeatherRepository(this.weatherApi, this.weatherSubApi);

  Future<OverAllWeather> getOverAllWeather(String city) async {
    var location = await weatherApi.getLocation(city);
    var weather = await weatherApi.getOverAllWeather(location);

    if ((city != null) && (city.startsWith('::geolocation_'))) {
      weather.city = '::geolocation_' + weather.city;
    } else {
      weather.city = city;
    }

    try {
      var weatherSub = await weatherSubApi.getOverAllWeather(location);
      weather.description = weatherSub.description;
      weather.alerts = weatherSub.alerts;
    } catch (e) {
      print(e);
    }
    
    return weather;
  }

  Future<CurrentWeather> getCurrentWeather(String city) async {
    return await weatherApi.getCurrentWeather(city);
  }

  Future<ForecastStat> getForecastWeather(String city) async {
    return await weatherApi.getForecastWeather(city);
  }
}