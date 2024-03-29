import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class WeatherEvent extends Equatable {
  const WeatherEvent();
}

class WeatherInitiated extends WeatherEvent {
  final String city;

  const WeatherInitiated({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

class WeatherRequested extends WeatherEvent {
  final String city;

  const WeatherRequested({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

class WeatherRefreshRequested extends WeatherEvent {
  final String city;

  const WeatherRefreshRequested({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}

class WeatherBackgroundRefreshRequested extends WeatherEvent {
  final String city;

  const WeatherBackgroundRefreshRequested({@required this.city}) : assert(city != null);

  @override
  List<Object> get props => [city];
}
