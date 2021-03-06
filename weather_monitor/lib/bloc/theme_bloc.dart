import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_monitor/bloc/theme_event.dart';
import 'package:weather_monitor/bloc/theme_state.dart';
import 'package:weather_monitor/model/theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {

  ThemeBloc(): super(
    ThemeState(
      appTheme: AppTheme.lightTheme,
    ),
  );

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeEvent) {
      yield ThemeState(
        appTheme: event.appTheme,
      );
    }
  }

}