import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'model/models.dart';

class NotificationService {
  static final NotificationService _instance = NotificationService._internal();

  factory NotificationService() {
    return _instance;
  }

  FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin;

  NotificationService._internal() {
    this._flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
  }

  void sendWeatherAlertNotification(List<WeatherAlert> weatherAlerts, String city) async {
    try {
      if ((weatherAlerts == null) || (weatherAlerts.length == 0))
        return;
      weatherAlerts.asMap().forEach((int i, WeatherAlert alert) async {
        BigTextStyleInformation bigTextStyleInformation =
        BigTextStyleInformation(
          alert.description,
          htmlFormatBigText: true,
          contentTitle: alert.event,
          htmlFormatContentTitle: true,
          summaryText: alert.description.substring(0, 10) + ' ...',
          htmlFormatSummaryText: true,
        );
        AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'WeatherAlertNotificationChannel', 'Weather Alert',
            'Get notifications about severe weather.',
            importance: Importance.high,
            priority: Priority.high,
            styleInformation: bigTextStyleInformation,
            showWhen: false);
        NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
        await _flutterLocalNotificationsPlugin.show(
            i, alert.event, alert.description, platformChannelSpecifics,
            payload: city);
        print('Weather alert notification sent');
      });
    } catch (e) {
      print('Send notification failed.');
      print(e);
    }
  }

  Future init() async {
    String selectedNotificationPayload;
    NotificationAppLaunchDetails notificationAppLaunchDetails =
    await _flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails.didNotificationLaunchApp ?? false) {
      selectedNotificationPayload = notificationAppLaunchDetails.payload;
    }

    const AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('ic_stat_notification');

    final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
    );

    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) async {
          if (payload != null) {
            print('notification payload: $payload');
          }
          selectedNotificationPayload = payload;
        });
  }
}