import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_monitor/bloc/blocs.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/notification_service.dart';
import 'package:weather_monitor/repository/repositories.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield* _mapWeatherRequestedToState(event);
    } else if (event is WeatherRefreshRequested) {
      yield* _mapWeatherRefreshRequestedToState(event);
    }
  }

  Stream<WeatherState> _mapWeatherRequestedToState(WeatherRequested event) async* {
    yield WeatherLoadInProgress();
    try {
      final OverAllWeather weather = await weatherRepository.getOverAllWeather(event.city);
      NotificationService().sendWeatherAlertNotification(weather);
      yield WeatherLoadSuccess(weather: weather);
    } catch (e) {
      print(e);
      yield WeatherLoadFailure(errorMessage: e.toString(), city: event.city);
    }
  }

  Stream<WeatherState> _mapWeatherRefreshRequestedToState(WeatherRefreshRequested event) async* {
    try {
      final OverAllWeather weather = await weatherRepository.getOverAllWeather(event.city);
      NotificationService().sendWeatherAlertNotification(weather);
      yield WeatherLoadSuccess(weather: weather);
    } catch (e) {
      print(e);
      yield WeatherLoadFailure(errorMessage: e.toString(), city: event.city);
      // TODO: Show error message but not flush current result
    }
  }
}
