import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/util/constants.dart';
import 'model/city.dart' as cityModel;

class LocationService {
  static final LocationService _instance = LocationService._internal();

  factory LocationService() {
    return _instance;
  }

  GeolocatorPlatform _geolocatorPlatform;
  StreamSubscription<ServiceStatus> _serviceStatusStreamSubscription;
  StreamSubscription<Position> _positionStreamSubscription;

  LocationService._internal() {
    this._geolocatorPlatform = GeolocatorPlatform.instance;
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      print('[LocationService] location services are disabled');
      Geolocator.openLocationSettings();
      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        print('[LocationService] location permission denied');
        return false;
      }
    } else if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      print('[LocationService] location permission denied forever');
      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    print('[LocationService] location permission granted');
    return true;
  }

  Future<cityModel.Location> getLocation() async {
    print('[LocationService] start to get location');
    final hasPermission = await _handlePermission();

    if (!hasPermission) {
      return null;
    }

    var locationSettings = LocationSettings(timeLimit: Duration(seconds: 30));
    Position position = null;
    try {
      position = await _geolocatorPlatform.getCurrentPosition(locationSettings: locationSettings);
    } on TimeoutException catch (e) {
      try {
        position = await _geolocatorPlatform.getLastKnownPosition();
      } catch (e) {
        print('[LocationService] $e');
      }
    } catch (e) {
      print('[LocationService] $e');
    }
    if (position == null) {
      print('[LocationService] could not get current location');
      return null;
    }

    print('[LocationService] got current location');
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble(Constants.LatitudeSettingKey, position.latitude);
    await prefs.setDouble(Constants.LongitudeSettingKey, position.longitude);
    print('[LocationService] saved to shared preferences');
    return cityModel.Location(latitude: position.latitude, longitude: position.longitude);
  }

  void _startServiceStatusStream() {
    if (_serviceStatusStreamSubscription != null) {
      return;
    }
    final serviceStatusStream = _geolocatorPlatform.getServiceStatusStream();
    _serviceStatusStreamSubscription = serviceStatusStream.handleError(
      (error) {
        _serviceStatusStreamSubscription?.cancel();
        _serviceStatusStreamSubscription = null;
      }
    ).listen(
      (serviceStatus) {
        String serviceStatusValue;
        if (serviceStatus == ServiceStatus.enabled) {
          _startPositionListening();
          serviceStatusValue = 'enabled';
        } else {
          if (_positionStreamSubscription != null) {
            _positionStreamSubscription?.cancel();
            _positionStreamSubscription = null;
            print('[LocationService] Position Stream has been canceled');
          }
          serviceStatusValue = 'disabled';
        }
        print('[LocationService] Location service has been $serviceStatusValue');
      }
    );
  }

  void _startPositionListening() {
    if (_positionStreamSubscription != null) {
      if (_positionStreamSubscription.isPaused) {
        _positionStreamSubscription.resume();
        print('[LocationService] Listening for position updates started');
      }
      return;
    }
    final positionStream = _geolocatorPlatform.getPositionStream();
    _positionStreamSubscription = positionStream.handleError(
      (error) {
        _positionStreamSubscription?.cancel();
        _positionStreamSubscription = null;
      }
    ).listen(
      (position) async {
        try {
          print('[LocationService] location changed');
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          await prefs.setDouble(Constants.LatitudeSettingKey, position.latitude);
          await prefs.setDouble(Constants.LongitudeSettingKey, position.longitude);
        } catch (e) {
          print('[LocationService] $e');
        }
      }
    );
    if (_positionStreamSubscription.isPaused) {
      _positionStreamSubscription.resume();
    }
    print('[LocationService] Listening for position updates started');
  }

  Future backgroundInit() async {
    try {
      _startServiceStatusStream();
      print('[LocationService] background initialized');
    } catch (e) {
      print(e);
    }
  }

  Future init() async {
    try {
      _startServiceStatusStream();
      print('[LocationService] foreground initialized');
    } catch (e) {
      print(e);
    }
  }

  Future dispose() async {
    try {
      if (_positionStreamSubscription != null) {
        _positionStreamSubscription.cancel();
        _positionStreamSubscription = null;
      }
      if (_serviceStatusStreamSubscription != null) {
        _serviceStatusStreamSubscription.cancel();
        _serviceStatusStreamSubscription = null;
      }
      print('[LocationService] disposed');
    } catch (e) {
      print(e);
    }
  }

}