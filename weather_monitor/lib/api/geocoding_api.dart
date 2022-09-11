import 'package:weather_monitor/model/models.dart';

abstract class GeocodingApi {
  Future<String> getCityName(Location location);
}