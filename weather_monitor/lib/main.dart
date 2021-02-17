import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:http/http.dart' as http;
import 'package:weather_monitor/model/theme.dart';

import 'api/apis.dart';
import 'bloc/blocs.dart';
import 'repository/repositories.dart';
import 'simple_bloc_observer.dart';
import 'widget/widgets.dart';

Future main() async {
  await DotEnv().load('.env');
  await Settings.init();

  Bloc.observer = SimpleBlocObserver();
  final WeatherRepository weatherRepository = WeatherRepository(
    OpenWeatherMapWeatherApi(
      apiKey: DotEnv().env['OPENWEATHERMAP_API_KEY'],
      httpClient: http.Client()
    )
  );

  runApp(WeatherApp(weatherRepository: weatherRepository,));
}

class WeatherApp extends StatelessWidget {
  final WeatherRepository weatherRepository;
  WeatherApp({Key key, @required this.weatherRepository})
      : assert(weatherRepository != null),
        super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<WeatherBloc>(
              create: (context) =>
                  WeatherBloc(weatherRepository: weatherRepository)
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
