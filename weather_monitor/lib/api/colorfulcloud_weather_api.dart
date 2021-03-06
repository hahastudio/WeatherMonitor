import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_monitor/api/apis.dart';
import 'package:weather_monitor/model/models.dart';

class ColorfulCloudWeatherApi extends WeatherSubApi {

  static const endPointHost = 'api.caiyunapp.com';
  static const endPointPrefix = '/v2.5';
  static final defaultHeader = {
    "user-agent": null
  };

  final String apiKey;
  final http.Client httpClient;

  ColorfulCloudWeatherApi({
    this.apiKey,
    this.httpClient,
  });

  @override
  Future<OverAllWeather> getOverAllWeather(Location location) async {
    if ((apiKey == null) || (apiKey == ''))
      return OverAllWeather();
    var queryParameters = {
      'lang': 'zh_CN',
      'unit': 'metric:v2',
      'alert': 'true',
    };
    final uri = Uri.https(endPointHost, endPointPrefix + '/${apiKey}/${location.longitude.toStringAsFixed(6)},${location.latitude.toStringAsFixed(6)}/weather.json', queryParameters);
    var response = await this.httpClient.get(uri, headers: defaultHeader);

    if (response.statusCode != 200) {
      return OverAllWeather();
    }

    var responseJson = jsonDecode(response.body);
    var weather = OverAllWeather();
    if (responseJson['result'] != null) {
      weather.description = responseJson['result']['forecast_keypoint'];
      if (responseJson['result']['alert'] != null) {
        if ((responseJson['result']['alert']['content'] != null) && (responseJson['result']['alert']['content'].length > 0)) {
          final alerts = <WeatherAlert>[];
          for (final item in responseJson['result']['alert']['content']) {
            alerts.add(WeatherAlert.fromColorfulCloudJson(item));
          }
          weather.alerts = alerts;
        }
      }
    }
    return weather;
  }

}