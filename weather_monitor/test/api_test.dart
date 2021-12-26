import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/api/apis.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/util/constants.dart';

import 'util/test_util.dart';

Future main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  group('OpenWeatherMap API test', () async {

    http.Client httpClient;

    setUpAll(() async {
      HttpOverrides.global = null;
      await prefs.setString(Constants.OpenWeatherApiSettingKey, dotenv.env['OPENWEATHERMAP_API_KEY']);
      httpClient = http.Client();
    });

    test('Test OpenWeatherMap onecall api', () async {
      var apiClient = OpenWeatherMapWeatherApi(httpClient: httpClient);
      var weather = await apiClient.getOverAllWeather(Location(latitude: 0, longitude: 0));
      printObject(weather.toJson());
    });

    test('Test OpenWeatherMap weather api', () async {
      var apiClient = OpenWeatherMapWeatherApi(httpClient: httpClient);
      var weather = await apiClient.getCurrentWeather('Shanghai');
      printObject(weather.toJson());
    });

    test('Test OpenWeatherMap forecast api', () async {
      var apiClient = OpenWeatherMapWeatherApi(httpClient: httpClient);
      var weather = await apiClient.getForecastWeather('Shanghai');
      printObject(weather.toJson());
    });
  });
}