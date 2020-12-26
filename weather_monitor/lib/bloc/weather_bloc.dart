import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:weather_monitor/bloc/blocs.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/repository/repositories.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;

  WeatherBloc({@required this.weatherRepository})
      : assert(weatherRepository != null),
        super(WeatherInitial());

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final OverAllWeather weather = await weatherRepository.getOverAllWeather(event.city);
        yield WeatherLoadSuccess(weather: weather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}
