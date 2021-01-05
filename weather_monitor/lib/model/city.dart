import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:weather_monitor/util/typeconverter.dart';

class City {
  /// City ID
  final double id;
  /// City name
  final String name;
  /// City location
  final Location coordinate;
  /// Country code (GB, JP etc.)
  final String country;
  /// Shift in seconds from UTC
  final int timezone;
  /// (where available) Sunrise time, UTC
  DateTime sunrise;
  /// (where available) Sunset time, UTC
  DateTime sunset;

  City({
    this.id,
    this.name,
    this.coordinate,
    this.country,
    this.timezone,
    this.sunrise,
    this.sunset
  });

  static City fromJson(Map<String, dynamic> json) {
    return City(
      id: intToDouble(json['id']),
      name: json['name'],
      coordinate: Location.fromJson(json['coord']),
      country: json['country'],
      timezone: json['timezone'],
      sunrise: json['sunrise'] != null ? DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000) : null,
      sunset: json['sunset'] != null ? DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000) : null,
    );
  }

  /// Convert json to a list of City objects
  static List<City> fromListJson(List json) {
    final cities = List<City>();
    for (final item in json) {
      cities.add(City.fromJson(item));
    }
    return cities;
  }

  Map<String, dynamic> toJson() {
    var result = {
      'id': id,
      'name': name,
      'coord': coordinate.toJson(),
      'country': country,
      'timezone': timezone,
    };
    if (sunrise != null)
      result['sunrise'] = sunrise.millisecondsSinceEpoch / 1000;
    if (sunset != null)
      result['sunset'] = sunset.millisecondsSinceEpoch / 1000;
    return result;
  }
}

class Location {
  /// City geo location, latitude
  final double latitude;
  /// City geo location, longitude
  final double longitude;

  Location({
    this.latitude,
    this.longitude,
  });

  static Location fromJson(Map<String, dynamic> json) {
    return Location(
      latitude: intToDouble(json['lat']),
      longitude: intToDouble(json['lon']),
    );
  }

  Map<String, dynamic> toJson() => {
    'lat': latitude,
    'lon': longitude,
  };
}

class CityViewModel {
  static List<City> cities;

  static Future loadCities() async {
    try {
      cities = new List<City>();
      String jsonString = await rootBundle.loadString('assets/current.city.list.min.json');
      List parsedJson = json.decode(jsonString) as List;
      for (int i = 0; i < parsedJson.length; i++) {
        cities.add(City.fromJson(parsedJson[i]));
      }
    } catch (e) {
      print(e);
    }
  }
}