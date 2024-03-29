import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/api/apis.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/notification_service.dart';
import 'package:weather_monitor/util/constants.dart';

class WeatherRepository {
  final WeatherApi weatherApi;
  final WeatherSubApi weatherSubApi;
  final GeocodingApi geocodingApi;

  WeatherRepository(this.weatherApi, this.weatherSubApi, this.geocodingApi);

  Future<OverAllWeather> getOverAllWeather(String city) async {
    print('[WeatherRepository] start to get OverAllWeather');
    print('[WeatherRepository] start to getLocation');
    var location = await weatherApi.getLocation(city);
    print('[WeatherRepository] start to getOverAllWeather');
    var weather = await weatherApi.getOverAllWeather(location);
    print('[WeatherRepository] start to getCityName');
    if ((city != null) && (city.startsWith(Constants.GpsPrefix))) {
      final locationName = await geocodingApi.getCityName(location);
      weather.city = Constants.GpsPrefix + locationName;
    } else {
      weather.city = city;
    }

    try {
      print('[WeatherRepository] start to getOverAllWeather from sub api');
      var weatherSub = await weatherSubApi.getOverAllWeather(location);
      weather.description = weatherSub.description;
      if (weatherSub.alerts != null) {
        weather.alerts = weatherSub.alerts;
      }
      if (weatherSub.current != null) {
        if (weatherSub.current.airQuality != null) {
          weather.current.airQuality = weatherSub.current.airQuality;
        }
      }
    } catch (e) {
      print(e);
    }

    if (weather != null) {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString(Constants.WeatherSettingKey, jsonEncode(weather.toJson()));
      print('[WeatherRepository] weather refreshed on ${weather.current.dt} stored.');

      if ((weather.alerts != null) && (weather.alerts.length > 0)) {
        List<String> alertJsons = prefs.getStringList(Constants.WeatherAlertsSettingKey);
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
        await prefs.setStringList(Constants.WeatherAlertsSettingKey, alertsToSaveJsons);
      }
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