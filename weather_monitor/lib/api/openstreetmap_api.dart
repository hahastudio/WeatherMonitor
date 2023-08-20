import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/api/apis.dart';
import 'package:weather_monitor/location_service.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/util/constants.dart';
import 'package:weather_monitor/util/extend_http_client.dart';

class OpenStreetMapApi implements GeocodingApi {

  static const endPointHost = 'nominatim.openstreetmap.org';
  static final defaultHeader = {
    "user-agent": null
  };

  static const unknownCityName = 'Unknown location';

  final HttpRetryClient httpClient;
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  OpenStreetMapApi({
    this.httpClient,
  });

  @override
  Future<String> getCityName(Location location) async {
    var queryParameters = {
      'lat': location.latitude.toString(),
      'lon': location.longitude.toString(),
      'zoom': '14',
      'format': 'json'
    };
    final uri = Uri.https(endPointHost, '/reverse', queryParameters);
    print('[OpenStreetMapApi] getCityName requested');
    var response = await this.httpClient.get(uri, headers: defaultHeader);
    print('[OpenStreetMapApi] getCityName responded');
    if (response.statusCode != 200) {
      throw Exception('error retrieving city name: status ${response.statusCode}');
    }
    try {
      final result = jsonDecode(utf8.decode(response.bodyBytes));
      if (result['address'] == null)
        return unknownCityName;
      if (result['address']['town'] != null)
        return result['address']['town'];
      if (result['address']['city'] != null)
        return result['address']['city'];
      if (result['address']['country'] != null)
        return result['address']['country'];
      return unknownCityName;
    } catch (e) {
      print('[OpenStreetMapApi] $e');
      return unknownCityName;
    }

  }

}