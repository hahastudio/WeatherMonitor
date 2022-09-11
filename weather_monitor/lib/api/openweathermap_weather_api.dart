import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/api/apis.dart';
import 'package:weather_monitor/location_service.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/util/constants.dart';
import 'package:weather_monitor/util/extend_http_client.dart';

class OpenWeatherMapWeatherApi implements WeatherApi, GeocodingApi {

  static const endPointHost = 'api.openweathermap.org';
  static const endPointPrefix = '/data/2.5';
  static final defaultHeader = {
    "user-agent": null
  };

  static const unknownCityName = 'Unknown location';

  final HttpRetryClient httpClient;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  OpenWeatherMapWeatherApi({
    this.httpClient,
  });

  Future<String> _getApiKey () async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(Constants.OpenWeatherApiSettingKey) ?? '';
  }

  @override
  Future<Location> getLocation(String city) async {
    try {
      if ((city != null) && (city.startsWith(Constants.GpsPrefix))) {
        return await LocationService().getLocation();
      }
    } catch (e) {
      print(e);
    }

    final SharedPreferences prefs = await _prefs;
    //FIXME: location may not be saved
    var latitude = prefs.getDouble(Constants.LatitudeSettingKey);
    var longitude = prefs.getDouble(Constants.LongitudeSettingKey);

    return Location(latitude: latitude, longitude: longitude);
  }

  @override
  Future<OverAllWeather> getOverAllWeather(Location location) async {
    var apiKey = await _getApiKey();
    if (apiKey == '')
      return null;

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

    return overAllWeather;
  }

  @override
  Future<String> getCityName(Location location) async {
    var apiKey = await _getApiKey();
    if (apiKey == '')
      return null;

    var queryParameters = {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'appid': apiKey,
      'limit': '1'
    };
    final uri = Uri.https(endPointHost, '/geo/1.0/reverse', queryParameters);
    print('[OpenWeatherMapApi] getCityName requested');
    var response = await this.httpClient.get(uri, headers: defaultHeader);
    print('[OpenWeatherMapApi] getCityName responded');
    if (response.statusCode != 200) {
      throw Exception('error retrieving city name: status ${response.statusCode}');
    }
    try {
      List responseList = jsonDecode(response.body);
      if (responseList.length <= 0)
        return unknownCityName;
      return responseList[0]['name'];
    } catch (e) {
      print('[OpenWeatherMapApi] $e');
      return unknownCityName;
    }

  }

  @override
  Future<CurrentWeather> getCurrentWeather(String city) async {
    var apiKey = await _getApiKey();
    if (apiKey == '')
      return null;

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
    var apiKey = await _getApiKey();
    if (apiKey == '')
      return null;

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