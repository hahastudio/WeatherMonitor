import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/api/openstreetmap_api.dart';
import 'package:weather_monitor/model/theme.dart';
import 'package:weather_monitor/util/extend_http_client.dart';

import 'api/apis.dart';
import 'background_service.dart';
import 'bloc/blocs.dart';
import 'location_service.dart';
import 'notification_service.dart';
import 'repository/repositories.dart';
import 'simple_bloc_observer.dart';
import 'util/constants.dart';
import 'widget/widgets.dart';

Future main() async {
  // needed if you intend to initialize in the `main` function
  WidgetsFlutterBinding.ensureInitialized();
  print('[Main] app launched');
  final prefs = await SharedPreferences.getInstance();
  String city = prefs.getString(Constants.CitySettingKey) ?? '';
  await Settings.init(cacheProvider: SharePreferenceCache());

  final WeatherRepository weatherRepository = WeatherRepository(
    OpenWeatherMapWeatherApi(
      httpClient: HttpRetryClient(http.Client())
    ),
    ColorfulCloudsWeatherApi(
      httpClient: HttpRetryClient(http.Client())
    ),
    OpenStreetMapApi(
      httpClient: HttpRetryClient(http.Client())
    ),
  );
  var weatherBloc = WeatherBloc(weatherRepository: weatherRepository);
  GetIt.instance.registerSingleton<WeatherBloc>(weatherBloc);

  await NotificationService().init();
  if ((city != null) && (city.startsWith(Constants.GpsPrefix))) {
    await LocationService().init();
  }
  await BackgroundService().init();

  var port = ReceivePort();
  if (IsolateNameServer.lookupPortByName('backgroundCallbackChannel') != null)
    IsolateNameServer.removePortNameMapping('backgroundCallbackChannel');
  var registerResult = IsolateNameServer.registerPortWithName(port.sendPort, 'backgroundCallbackChannel');
  if (!registerResult)
    print('[Main] failed to register port');
  else {
    port.listen((dynamic data) async {
      print('[Main][backgroundCallbackChannel listener] got $data');
      var task = data.toString();
      final prefs = await SharedPreferences.getInstance();
      await prefs.reload();
      switch (task) {
        case 'WeatherRequested':
          if (await WeatherBloc.IsInitialized())
            weatherBloc.add(WeatherRequested(city: city));
          break;
        case 'WeatherRefreshRequested':
          if (await WeatherBloc.IsInitialized())
            weatherBloc.add(WeatherRefreshRequested(city: city));
          break;
        case 'WeatherBackgroundRefreshRequested':
          if (await WeatherBloc.IsInitialized())
            weatherBloc.add(WeatherBackgroundRefreshRequested(city: city));
      }
      print('[Main][backgroundCallbackChannel listener] finished processing $data');
    });
    BackgroundService().registerWeatherRefreshPeriodicTask();
  }

  print('[Main] main initialization finished');
  BlocOverrides.runZoned(
    () {
      runApp(WeatherApp());
    },
    blocObserver: SimpleBlocObserver(),
  );
}

class WeatherApp extends StatefulWidget {
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {

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
          return WillPopScope(
            child: MaterialApp(
              title: 'Weather Monitor',
              theme: AppThemes.appThemeData[AppTheme.lightTheme],
              darkTheme: AppThemes.appThemeData[AppTheme.darkTheme],
              themeMode: AppThemes.convert(themeState.appTheme),
              home: WeatherWidget(),
            ),
            onWillPop: () async {
              print('[Main] move task to back');
              return false;
            },
          );
        }
      )
    );
  }

  @override
  void dispose() {
    LocationService().dispose();
    super.dispose();
  }
}
