import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/city.dart' as cityModel;

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() {
    return _instance;
  }

  Location _location;

  LocationService._internal() {
    this._location = Location();
  }

  Future<bool> initLocation(Location loc, {int limit = 10}) async {
    for (int i = 0; i < limit; i++) {
      try {
        return await loc.serviceEnabled();
      } on PlatformException {
        await Future.delayed(Duration(milliseconds: 300));
      }
    }
    throw Exception('Failed to initialize location service.');
  }

  Future<cityModel.Location> getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await initLocation(this._location);
    if (!_serviceEnabled) {
      _serviceEnabled = await this._location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await this._location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await this._location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    LocationData currentPosition = await this._location.getLocation();
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('city.coordinate.latitude', currentPosition.latitude);
    await prefs.setDouble('city.coordinate.longitude', currentPosition.longitude);
    return cityModel.Location(latitude: currentPosition.latitude, longitude: currentPosition.longitude);
  }

  Future backgroundInit() async {
    var enabled = await this._location.enableBackgroundMode(enable: true);
    if (!enabled) {
      print('Location service failed to run in background mode.');
    }
  }

  Future init() async {
    var enabled = false;
    try {
      enabled = await this._location.enableBackgroundMode(enable: true);
    } catch (e) {
      print(e);
    }
    if (!enabled) {
      print('Location service failed to run in background mode.');
    } else {
      /*
      this._location.changeSettings(interval: 5 * 60 * 1000);
      this._location.onLocationChanged.listen((LocationData currentLocation) async {
        try {
          print('Location changed');
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setDouble('city.coordinate.latitude', currentLocation.latitude);
          await prefs.setDouble('city.coordinate.longitude', currentLocation.longitude);
        } catch (e) {
          print(e);
        }
      });
      */
    }
  }

}