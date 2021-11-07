import 'package:location/location.dart';
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

  Future<cityModel.Location> getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await this._location.serviceEnabled();
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
    return cityModel.Location(latitude: currentPosition.latitude, longitude: currentPosition.longitude);
  }

}