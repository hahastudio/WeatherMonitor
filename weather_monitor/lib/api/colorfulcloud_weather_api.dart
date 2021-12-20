import 'dart:convert';
import 'package:weather_monitor/api/apis.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/util/extend_http_client.dart';
import 'package:weather_monitor/util/typeconverter.dart';

class ColorfulCloudWeatherApi extends WeatherSubApi {

  static const endPointHost = 'api.caiyunapp.com';
  static const endPointPrefix = '/v2.5';
  static final defaultHeader = {
    "user-agent": null
  };

  final String apiKey;
  final HttpRetryClient httpClient;

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
    print('[ColorfulCloudApi] getOverAllWeather requested');
    var response = await this.httpClient.get(uri, headers: defaultHeader);
    print('[ColorfulCloudApi] getOverAllWeather responded');
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
      if (responseJson['result']['realtime'] != null) {
        weather.current = Weather();
        if (responseJson['result']['realtime']['air_quality'] != null) {
          if (responseJson['result']['realtime']['air_quality']['aqi'] != null) {
            weather.current.airQuality = AirQuality();
            if (responseJson['result']['realtime']['air_quality']['aqi']['usa'] != null) {
              weather.current.airQuality.aqi = intToDouble(responseJson['result']['realtime']['air_quality']['aqi']['usa']);
            } else if (responseJson['result']['realtime']['air_quality']['aqi']['chn'] != null) {
              weather.current.airQuality.aqi = intToDouble(responseJson['result']['realtime']['air_quality']['aqi']['chn']);
            } else {
              weather.current.airQuality = null;
            }
          }
        }
      }

    }
    return weather;
  }

}