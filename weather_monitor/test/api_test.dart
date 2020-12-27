import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:weather_monitor/api/apis.dart';
import 'package:weather_monitor/model/models.dart';

import 'util/test_util.dart';

Future main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await DotEnv().load();

  group('OpenWeatherMap API test', () {

    String apiKey = '';
    http.Client httpClient;

    setUpAll(() {
      HttpOverrides.global = null;
      apiKey = DotEnv().env['OPENWEATHERMAP_API_KEY'];
      httpClient = http.Client();
    });

    test('Test OpenWeatherMap onecall api', () async {
      var apiClient = OpenWeatherMapWeatherApi(apiKey: apiKey, httpClient: httpClient);
      var weather = await apiClient.getOverAllWeather(Location(latitude: 0, longitude: 0));
      printObject(weather.toJson());
    });

    test('Test OpenWeatherMap weather api', () async {
      var apiClient = OpenWeatherMapWeatherApi(apiKey: apiKey, httpClient: httpClient);
      var weather = await apiClient.getCurrentWeather('Shanghai');
      printObject(weather.toJson());
    });

    test('Test OpenWeatherMap forecast api', () async {
      var apiClient = OpenWeatherMapWeatherApi(apiKey: apiKey, httpClient: httpClient);
      var weather = await apiClient.getForecastWeather('Shanghai');
      printObject(weather.toJson());
    });
  });
}