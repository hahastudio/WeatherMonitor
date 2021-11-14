import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/model/theme.dart';

import 'api/apis.dart';
import 'background_service.dart';
import 'bloc/blocs.dart';
import 'location_service.dart';
import 'notification_service.dart';
import 'repository/repositories.dart';
import 'simple_bloc_observer.dart';
import 'widget/widgets.dart';

Future main() async {
  print('[Main] app launched');
  await dotenv.load(fileName: ".env");
  await Settings.init();
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();

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
  var weatherBloc = WeatherBloc(weatherRepository: weatherRepository);
  GetIt.instance.registerSingleton<WeatherBloc>(weatherBloc);
  Bloc.observer = SimpleBlocObserver();

  await NotificationService().init();
  await LocationService().init();
  await BackgroundService().init();

  var port = ReceivePort();
  if (IsolateNameServer.lookupPortByName('backgroundCallbackChannel') != null)
    IsolateNameServer.removePortNameMapping('backgroundCallbackChannel');
  var registerResult = IsolateNameServer.registerPortWithName(port.sendPort, 'backgroundCallbackChannel');
  if (!registerResult)
    print('[Main] failed to register port');
  port.listen((dynamic data) async {
    print('[Main][backgroundCallbackChannel listener] got $data');
    var task = data.toString();
    switch (task) {
      case 'WeatherRequested':
        final prefs = await SharedPreferences.getInstance();
        String city = prefs.getString('city') ?? '';
        if (city != '')
          weatherBloc.add(WeatherRequested(city: city));
        break;
      case 'WeatherRefreshRequested':
        final prefs = await SharedPreferences.getInstance();
        String city = prefs.getString('city') ?? '';
        if (city != '')
          weatherBloc.add(WeatherRefreshRequested(city: city));
        break;
    }
    print('[Main][backgroundCallbackChannel listener] finished processing $data');
  });
  BackgroundService().registerWeatherRefreshPeriodicTask();
  print('[Main] main initialization finished');

  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  WeatherApp()
      : super();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
              create: (context) =>
                GetIt.instance<WeatherBloc>()
          ),
          BlocProvider<ThemeBloc>(
              create: (context) =>
                  ThemeBloc()
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (BuildContext context, ThemeState themeState) {
              return MaterialApp(
                title: 'Weather Monitor',
                theme: AppThemes.appThemeData[themeState.appTheme],
                home: WeatherWidget(),
              );
            }
        )
    );
  }
}
