import 'package:equatable/equatable.dart';
import 'package:weather_monitor/model/theme.dart';

class ThemeEvent extends Equatable {
  final AppTheme appTheme;
  ThemeEvent({this.appTheme});

  @override
  List<Object> get props => [appTheme];
}