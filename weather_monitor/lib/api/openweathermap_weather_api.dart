import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/api/apis.dart';
import 'package:weather_monitor/location_service.dart';
import 'package:weather_monitor/model/models.dart';

class OpenWeatherMapWeatherApi extends WeatherApi {

  static const endPointHost = 'api.openweathermap.org';
  static const endPointPrefix = '/data/2.5';
  static final defaultHeader = {
    "user-agent": null
  };

  final String apiKey;
  final http.Client httpClient;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  OpenWeatherMapWeatherApi({
    this.apiKey,
    this.httpClient,
  });

  @override
  Future<Location> getLocation(String city) async {
    try {
      if ((city != null) && (city.startsWith('::geolocation_'))) {
        return await LocationService().getLocation();
      }
    } catch (e) {
      print(e);
    }

    final SharedPreferences prefs = await _prefs;
    //FIXME: location may not be saved
    var latitude = prefs.getDouble('city.coordinate.latitude');
    var longitude = prefs.getDouble('city.coordinate.longitude');

    return Location(latitude: latitude, longitude: longitude);
  }

  @override
  Future<OverAllWeather> getOverAllWeather(Location location) async {
    var queryParameters = {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'exclude': 'minutely',
      'appid': apiKey
    };
    final uri = Uri.https(endPointHost, endPointPrefix + '/onecall', queryParameters);
    print('[OpenWeatherMapApi] getOverAllWeather requested');
    var response = await this.httpClient.get(uri, headers: defaultHeader);
    print('[OpenWeatherMapApi] getOverAllWeather responded');
    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: status ${response.statusCode}');
    }

    var overAllWeather = OverAllWeather.fromJson(jsonDecode(response.body));
    var city = await getCityName(location);
    overAllWeather.city = city;

    return overAllWeather;
  }

  Future<String> getCityName(Location location) async {
    var queryParameters = {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'appid': apiKey
    };
    final uri = Uri.https(endPointHost, endPointPrefix + '/weather', queryParameters);
    print('[OpenWeatherMapApi] getCityName requested');
    var response = await this.httpClient.get(uri, headers: defaultHeader);
    print('[OpenWeatherMapApi] getCityName responded');
    if (response.statusCode != 200) {
      throw Exception('error retrieving city name: status ${response.statusCode}');
    }

    Map responseJson = jsonDecode(response.body);
    return responseJson['name'];
  }

  @override
  Future<CurrentWeather> getCurrentWeather(String city) async {
    var queryParameters = {
      'q': city,
      'appid': apiKey
    };
    final uri = Uri.https(endPointHost, endPointPrefix + '/weather', queryParameters);
    print('[OpenWeatherMapApi] getCurrentWeather requested');
    var response = await this.httpClient.get(uri, headers: defaultHeader);
    print('[OpenWeatherMapApi] getCurrentWeather responded');
    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: status ${response.statusCode}');
    }

    return CurrentWeather.fromJson(jsonDecode(response.body));
  }

  @override
  Future<ForecastStat> getForecastWeather(String city) async {
    var queryParameters = {
      'q': city,
      'appid': apiKey
    };
    final uri = Uri.https(endPointHost, endPointPrefix + '/forecast', queryParameters);
    var response = await this.httpClient.get(uri, headers: defaultHeader);

    if (response.statusCode != 200) {
      throw Exception('error retrieving weather: status ${response.statusCode}');
    }

    return ForecastStat.fromJson(jsonDecode(response.body));
  }

}