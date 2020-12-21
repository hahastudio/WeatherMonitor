import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_monitor/api/weather_api.dart';
import 'package:weather_monitor/model/weather.dart';

class OpenWeatherMapWeatherApi extends WeatherApi {

  static const endPointHost = 'api.openweathermap.org';
  static const endPointPrefix = '/data/2.5';
  final String apiKey;
  final http.Client httpClient;

  OpenWeatherMapWeatherApi({
    this.apiKey,
    this.httpClient,
  });

  @override
  Future<Location> getLocation(String city) async {
    // TODO: implement getLocation
    throw UnimplementedError();
  }

  @override
  Future<OverAllWeather> getWeather(Location location) async {
    var queryParameters = {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'exclude': 'minutely',
      'appid': apiKey
    };
    final uri = Uri.https(endPointHost, endPointPrefix + '/onecall', queryParameters);
    var response = await this.httpClient.get(uri);

    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: status ${response.statusCode}');
    }

    return OverAllWeather.fromJson(jsonDecode(response.body));
  }

}