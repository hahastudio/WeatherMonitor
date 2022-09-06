import 'dart:ui';
import 'package:flutter/foundation.dart' as Foundation;
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/util/constants.dart';
import 'package:weather_monitor/util/extend_http_client.dart';
import 'package:workmanager/workmanager.dart';

import 'api/apis.dart';
import 'notification_service.dart';
import 'repository/repositories.dart';

// task type
const weatherRefreshPeriodicTask = "weatherRefreshPeriodicTask";

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    try {
      print('[Background] background task started.');
      final WeatherRepository weatherRepository = WeatherRepository(
          OpenWeatherMapWeatherApi(
              httpClient: HttpRetryClient(http.Client())
          ),
          ColorfulCloudsWeatherApi(
              httpClient: HttpRetryClient(http.Client())
          )
      );
      await NotificationService().init();
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.reload();

      switch (task) {
        case weatherRefreshPeriodicTask:
          print("[Background] $weatherRefreshPeriodicTask triggered.");
          String city = prefs.getString(Constants.CitySettingKey) ?? '';
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
    } catch (e, stack) {
      print("[Background] $e\n$stack");
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
      existingWorkPolicy: ExistingWorkPolicy.append
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