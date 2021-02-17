import 'package:equatable/equatable.dart';
import 'package:weather_monitor/model/theme.dart';

class ThemeState extends Equatable {
  final AppTheme appTheme;
  ThemeState({this.appTheme});

  @override
  List<Object> get props => [appTheme];
}