import 'dart:ui';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:workmanager/workmanager.dart';

import 'api/apis.dart';
import 'location_service.dart';
import 'notification_service.dart';
import 'repository/repositories.dart';

// task type
const weatherRefreshPeriodicTask = "weatherRefreshPeriodicTask";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      print('[Background] background task started.');
      await dotenv.load(fileName: ".env");
      final WeatherRepository weatherRepository = WeatherRepository(
          OpenWeatherMapWeatherApi(
              apiKey: dotenv.env['OPENWEATHERMAP_API_KEY'],
              httpClient: http.Client()
          ),
          ColorfulCloudWeatherApi(
              apiKey: dotenv.env['COLORFULCLOUD_API_KEY'],
              httpClient: http.Client()
          )
      );
      await NotificationService().init();
      await LocationService().backgroundInit();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.reload();

      switch (task) {
        case weatherRefreshPeriodicTask:
          print("[Background] $weatherRefreshPeriodicTask triggered.");
          String city = prefs.getString('city') ?? '';
          if (city != '')
            await weatherRepository.getOverAllWeather(city);
          var sendPort = IsolateNameServer.lookupPortByName('backgroundCallbackChannel');
          if (sendPort != null) {
            // The port might be null if the main isolate is not running.
            sendPort.send('WeatherBackgroundRefreshRequested');
            print("[Background][backgroundCallbackChannel sender] WeatherRefreshRequested sent");
          }
          print("[Background] $weatherRefreshPeriodicTask finished.");
          break;
      }
      return Future.value(true);
    } catch (e) {
      print("[Background] $e");
      return Future.value(false);
    }
  });
}

class BackgroundService {
  static final BackgroundService _instance = BackgroundService._internal();

  factory BackgroundService() {
    return _instance;
  }

  BackgroundService._internal() ;

  void registerWeatherRefreshPeriodicTask() {
    Workmanager().registerPeriodicTask(
      weatherRefreshPeriodicTask,
      weatherRefreshPeriodicTask,
      initialDelay: Duration(minutes: 1),
      frequency: Duration(minutes: 15),
      constraints: Constraints(
        networkType: NetworkType.connected
      )
    );
    print("[Background] $weatherRefreshPeriodicTask registered.");
  }

  Future init() async {
    Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: Foundation.kDebugMode,
    );
    print("[Background] $weatherRefreshPeriodicTask initialized.");
  }

}