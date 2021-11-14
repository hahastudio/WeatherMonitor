import 'dart:ui';

import 'package:workmanager/workmanager.dart';

// task type
const weatherRefreshPeriodicTask = "weatherRefreshPeriodicTask";

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    switch (task) {
      case weatherRefreshPeriodicTask:
        print("[Background] $weatherRefreshPeriodicTask triggered.");
        final sendPort = IsolateNameServer.lookupPortByName('backgroundCallbackChannel');
        if (sendPort != null) {
          // The port might be null if the main isolate is not running.
          sendPort.send('WeatherRefreshRequested');
          print("[Background][backgroundCallbackChannel sender] WeatherRefreshRequested sent.");
        }
        print("[Background] $weatherRefreshPeriodicTask finished.");
        break;
    }
    return Future.value(true);
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
      //isInDebugMode: true,
    );
    print("[Background] $weatherRefreshPeriodicTask initialized.");
  }

}