import 'package:weather_monitor/util/typeconverter.dart';

/// Overall weather details from https://openweathermap.org/api/one-call-api
class OverAllWeather {
  double latitude;
  double longitude;
  String timezone;
  int timezoneOffset;
  Weather current;
  List<Weather> minutely;
  List<Weather> hourly;
  List<Weather> daily;
  List<WeatherAlert> alerts;

  OverAllWeather({
    this.latitude,
    this.longitude,
    this.timezone,
    this.timezoneOffset,
    this.current,
    this.minutely,
    this.hourly,
    this.daily,
    this.alerts
  });

  /// Convert Json to OverAllWeather object
  static OverAllWeather fromJson(Map<String, dynamic> json) {
    var result = OverAllWeather(
      latitude: intToDouble(json['lat']),
      longitude: intToDouble(json['lon']),
      timezone: json['timezone'],
      timezoneOffset: json['timezone_offset'],
      current: json['current'] != null ? Weather.fromJson(json['current']) : null,
    );
    if (json['minutely'] != null) {
      result.minutely = Weather.fromListJson(json['minutely']);
    }
    if (json['hourly'] != null) {
      result.hourly = Weather.fromListJson(json['hourly']);
    }
    if (json['daily'] != null) {
      result.daily = Weather.fromListJson(json['daily']);
    }
    if (json['alerts'] != null) {
      result.alerts = WeatherAlert.fromListJson(json['alerts']);
    }
    return result;
  }

  Map<String, dynamic> toJson() {
    var result = Map<String, dynamic>();
    result['lat'] = latitude;
    result['lon'] = longitude;
    result['timezone'] = timezone;
    result['timezone_offset'] = timezoneOffset;
    if (current != null)
      result['current'] = current.toJson();
    if (minutely != null)
      result['minutely'] = minutely.map((w) => w.toJson()).toList();
    if (hourly != null)
      result['hourly'] = hourly.map((w) => w.toJson()).toList();
    if (daily != null)
      result['daily'] = daily.map((w) => w.toJson()).toList();
    if (alerts != null)
      result['alerts'] = alerts.map((a) => a.toJson()).toList();
    return result;
  }
}

/// Weather model for data from api.openweathermap.org
class Weather {
  /// time, UTC
  DateTime dt;
  /// (where available) Sunrise time, UTC
  DateTime sunrise;
  /// (where available) Sunset time, UTC
  DateTime sunset;
  /// Units - default: kelvin, metric: Celsius, imperial: Fahrenheit.
  Temperature temp;
  /// Daily temperature stat
  TemperatureStat tempDaily;
  /// This temperature parameter accounts for the human perception of weather.
  /// Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
  Temperature feelsLike;
  /// Daily temperature stat. This temperature parameter accounts for the human perception of weather.
  TemperatureStat feelsLikeDaily;
  /// Atmospheric pressure on the sea level, hPa
  double pressure;
  /// Humidity, %
  double humidity;
  /// Atmospheric temperature (varying according to pressure and humidity) below which water droplets begin to condense and dew can form.
  /// Units – default: kelvin, metric: Celsius, imperial: Fahrenheit.
  Temperature dewPoint;
  /// Cloudiness, %
  double clouds;
  /// Current UV index
  double uvi;
  /// Average visibility, metres
  double visibility;
  /// Wind details
  Wind wind;
  /// (where available) Probability of precipitation
  double probability;
  /// (where available) Precipitation volume, mm
  double rain;
  /// (where available) Rain volume precipitations
  Rain rainVolumes;
  /// (where available) Snow volume, mm
  double snow;
  /// (where available) Snow volume precipitations
  Snow snowVolumes;
  /// Weather condition
  WeatherCondition weather;

  Weather({
    this.dt,
    this.sunrise,
    this.sunset,
    this.temp,
    this.tempDaily,
    this.feelsLike,
    this.feelsLikeDaily,
    this.pressure,
    this.humidity,
    this.dewPoint,
    this.clouds,
    this.uvi,
    this.visibility,
    this.wind,
    this.probability,
    this.rain,
    this.rainVolumes,
    this.snow,
    this.snowVolumes,
    this.weather
  });

  /// Convert Json to Weather object
  static Weather fromJson(Map<String, dynamic> json) {
    var result = Weather(
      dt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      sunrise: json['sunrise'] != null ? DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000) : null,
      sunset: json['sunset'] != null ? DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000) : null,
      pressure: intToDouble(json['pressure']),
      humidity: intToDouble(json['humidity']),
      dewPoint: Temperature(intToDouble(json['dew_point'])),
      clouds: intToDouble(json['clouds']),
      uvi: intToDouble(json['uvi']),
      visibility: intToDouble(json['visibility']),
      wind: Wind.fromJson({
        'wind_speed': json['wind_speed'],
        'wind_deg': json['wind_deg'],
        'wind_gust': json['wind_gust'],
      }),
      probability: json['pop'] != null ? intToDouble(json['pop']) : null,
      weather: WeatherCondition.fromJson(json['weather'][0]),
    );
    if (json['temp'] is Map) {
      result.tempDaily = TemperatureStat.fromJson(json['temp']);
    } else {
      result.temp = Temperature(intToDouble(json['temp']));
    }
    if (json['feels_like'] is Map) {
      result.feelsLikeDaily = TemperatureStat.fromJson(json['feels_like']);
    } else {
      result.feelsLike = Temperature(intToDouble(json['feels_like']));
    }
    if (json['rain'] != null) {
      if (json['rain'] is Map) {
        result.rainVolumes = Rain.fromJson(json['rain']);
      } else {
        result.rain = intToDouble(json['rain']);
      }
    }
    if (json['snow'] != null) {
      if (json['snow'] is Map) {
        result.snowVolumes = Snow.fromJson(json['snow']);
      } else {
        result.snow = intToDouble(json['snow']);
      }
    }
    return result;
  }

  /// Convert json to a list of Weather objects
  static List<Weather> fromListJson(List json) {
    final weathers = List<Weather>();
    for (final item in json) {
      weathers.add(Weather.fromJson(item));
    }
    return weathers;
  }

  Map<String, dynamic> toJson() {
    var result = Map<String, dynamic>();
    result['dt'] = dt.toString();
    if (sunrise != null)
      result['sunrise'] = sunrise.millisecondsSinceEpoch / 1000;
    if (sunset != null)
      result['sunset'] = sunset.millisecondsSinceEpoch / 1000;
    result['pressure'] = pressure;
    result['humidity'] = humidity;
    result['dew_point'] = dewPoint.kelvin;
    result['clouds'] = clouds;
    result['uvi'] = uvi;
    result['visibility'] = visibility;
    result['wind_speed'] = wind.speed;
    if (wind.gust != null)
      result['wind_gust'] = wind.gust;
    result['wind_deg'] = wind.deg;
    if (probability != null)
      result['pop'] = probability;
    result['weather'] = [ weather.toJson() ];
    if (temp != null) {
      result['temp'] = temp.kelvin;
    } else {
      result['temp'] = tempDaily.toJson();
    }
    if (feelsLike != null) {
      result['feels_like'] = feelsLike.kelvin;
    } else {
      result['feels_like'] = feelsLikeDaily.toJson();
    }
    if (rain != null) {
      result['rain'] = rain;
    } else if (rainVolumes != null) {
      result['rain'] = rainVolumes.toJson();
    }
    if (snow != null) {
      result['snow'] = snow;
    } else if (snowVolumes != null) {
      result['snow'] = snowVolumes.toJson();
    }
    return result;
  }
}

/// Temperature stored as kelvin unit
/// Can convert to kelvin, celsius, or fahrenheit
class Temperature {
  final double _kelvin;

  Temperature(this._kelvin) : assert(_kelvin != null);

  double get kelvin => _kelvin;

  double get celsius => _kelvin - 273.15;

  double get fahrenheit => _kelvin * (9/5) - 459.67;

  double as(TemperatureUnit unit){
    switch(unit){
      case TemperatureUnit.kelvin:
        return this.kelvin;
        break;
      case TemperatureUnit.celsius:
        return this.celsius;
        break;
      case TemperatureUnit.fahrenheit:
        return this.fahrenheit;
        break;
    }
    return this.fahrenheit;
  }
}

/// Units of temperature
enum TemperatureUnit {
  kelvin,
  celsius,
  fahrenheit
}

/// Cloud details
class Cloud {
  /// Cloudiness, % (string => double).
  /// Key: all (where available) Total cloudiness, %
  Map<String, double> percentages;

  Cloud({ this.percentages });

  /// Convert Json to Rain
  static Cloud fromJson(Map<String, dynamic> json) {
    return Cloud(percentages: json.map((key, value) => MapEntry(key, intToDouble(value))));
  }

  Map<String, dynamic> toJson() => percentages;
}

/// Wind details
class Wind {
  /// Wind speed.
  /// Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour.
  double speed;
  /// Wind direction, degrees (meteorological)
  double deg;
  /// (where available) Wind gust.
  /// Unit Default: meter/sec, Metric: meter/sec, Imperial: miles/hour
  double gust;

  Wind({
    this.speed,
    this.deg,
    this.gust,
  });


  /// Convert Json to Wind
  static Wind fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: intToDouble(json['speed']),
      deg: intToDouble(json['deg']),
      gust: json['gust'] != null ? intToDouble(json['gust']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    var result = {
      'speed': speed,
      'deg': deg,
    };
    if (gust != null)
      result['gust'] = gust;
    return result;
  }
}

/// Rain details
class Rain {
  /// Rain volume (string => double).
  /// Key: 1h (where available) Rain volume for last hour, mm
  /// Key: 3h (where available) Rain volume for last 3 hours, mm
  Map<String, double> volume;

  Rain({ this.volume });

  /// Convert Json to Rain
  static Rain fromJson(Map<String, dynamic> json) {
    return Rain(volume: json.map((key, value) => MapEntry(key, intToDouble(value))));
  }

  Map<String, dynamic> toJson() => volume;
}

/// Snow details
class Snow {
  /// Snow volume (string => double).
  /// Key: 1h (where available) Snow volume for last hour, mm
  /// Key: 3h (where available) Snow volume for last 3 hours, mm
  Map<String, double> volume;

  Snow({ this.volume });

  /// Convert Json to Snow
  static Snow fromJson(Map<String, dynamic> json) {
    return Snow(volume: json.map((key, value) => MapEntry(key, intToDouble(value))));
  }

  Map<String, dynamic> toJson() => volume;
}

/// Weather condition
class WeatherCondition {
  /// Weather condition id
  int id;
  /// Group of weather parameters (Rain, Snow, Extreme etc.)
  String main;
  /// Weather condition within the group.
  String description;
  /// Weather icon id.
  String icon;

  WeatherCondition({
    this.id,
    this.main,
    this.description,
    this.icon
  });

  /// Convert Json to WeatherCondition
  static WeatherCondition fromJson(Map<String, dynamic> json) {
    return WeatherCondition(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'main': main,
    'description': description,
    'icon': icon
  };
}

/// Temperature Stats for a day
class TemperatureStat {
  /// (where available) Min daily temperature.
  Temperature min;
  /// (where available) Max daily temperature.
  Temperature max;
  /// Morning temperature.
  Temperature morning;
  /// Day temperature.
  Temperature day;
  /// Evening temperature.
  Temperature evening;
  /// Night temperature.
  Temperature night;

  TemperatureStat({
    this.min,
    this.max,
    this.morning,
    this.day,
    this.evening,
    this.night
  });

  /// Convert Json to TemperatureStat
  static TemperatureStat fromJson(Map<String, dynamic> json) {
    return TemperatureStat(
      min: json['min'] != null ? Temperature(intToDouble(json['min'])) : null,
      max: json['min'] != null ? Temperature(intToDouble(json['max'])) : null,
      morning: Temperature(intToDouble(json['morn'])),
      day: Temperature(intToDouble(json['day'])),
      evening: Temperature(intToDouble(json['eve'])),
      night: Temperature(intToDouble(json['night'])),
    );
  }

  Map<String, dynamic> toJson() {
    var result = Map<String, dynamic>();
    if (min != null)
      result['min'] = min.kelvin;
    if (max != null)
      result['max'] = max.kelvin;
    result['morn'] = morning.kelvin;
    result['day'] = day.kelvin;
    result['eve'] = evening.kelvin;
    result['night'] = night.kelvin;
    return result;
  }
}

/// National weather alerts data from major national weather warning systems
class WeatherAlert {
  /// Name of the alert source.
  String senderName;
  /// Alert event name
  String event;
  /// Date and time of the start of the alert, UTC
  DateTime start;
  /// Date and time of the end of the alert, UTC
  DateTime end;
  /// Description of the alert
  DateTime description;

  WeatherAlert({
    this.senderName,
    this.event,
    this.start,
    this.end,
    this.description
  });

  /// Convert Json to WeatherAlert
  static WeatherAlert fromJson(Map<String, dynamic> json) {
    return WeatherAlert(
      senderName: json['sender_name'],
      event: json['event'],
      start: DateTime.fromMillisecondsSinceEpoch(json['start'] * 1000),
      end: DateTime.fromMillisecondsSinceEpoch(json['end'] * 1000),
      description: json['description'],
    );
  }

  /// Convert Json to a list of WeatherAlert objects
  static List<WeatherAlert> fromListJson(List json) {
    final alerts = List<WeatherAlert>();
    for (final item in json) {
      alerts.add(WeatherAlert.fromJson(item));
    }
    return alerts;
  }

  Map<String, dynamic> toJson() => {
    'sender_name': senderName,
    'event': event,
    'start': start.millisecondsSinceEpoch / 1000,
    'end': end.millisecondsSinceEpoch / 1000,
    'description': description
  };
}

class CurrentWeather {
  /// Time of data forecasted, UTC
  DateTime dt;
  /// Main weather stats
  ForecastMainWeather main;
  /// Weather condition
  WeatherCondition weather;
  /// Cloudiness, %
  Cloud clouds;
  /// Wind
  Wind wind;
  /// (where available) Rain volume for last 3 hours, mm
  Rain rain;
  /// (where available) Snow volume for last 3 hours
  Snow snow;
  /// City ID
  final int id;
  /// City name
  final String name;
  /// City location
  final Location coordinate;
  /// Shift in seconds from UTC
  final int timezone;
  /// Country code (GB, JP etc.)
  final String country;
  /// Sunrise time, UTC
  DateTime sunrise;
  /// Sunset time, UTC
  DateTime sunset;

  CurrentWeather({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.rain,
    this.snow,
    this.id,
    this.name,
    this.coordinate,
    this.timezone,
    this.country,
    this.sunrise,
    this.sunset,
  });

  /// Convert Json to CurrentWeather
  static CurrentWeather fromJson(Map<String, dynamic> json) {
    return CurrentWeather(
      dt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      main: ForecastMainWeather.fromJson(json['main']),
      weather: WeatherCondition.fromJson(json['weather'][0]),
      clouds: json['clouds'] != null ? Cloud.fromJson(json['clouds']) : null,
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      snow: json['snow'] != null ? Snow.fromJson(json['snow']) : null,
      id: json['id'],
      name: json['name'],
      coordinate: Location.fromJson(json['coord']),
      timezone: json['timezone'],
      country: json['sys']['country'],
      sunrise: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunrise'] * 1000),
      sunset: DateTime.fromMillisecondsSinceEpoch(json['sys']['sunset'] * 1000),
    );
  }

  Map<String, dynamic> toJson() {
    var result = {
      'dt': dt.millisecondsSinceEpoch / 1000,
      'main': main.toJson(),
      'weather': [ weather.toJson() ],
      'sys': {
        'country': country,
        'sunrise': sunrise.millisecondsSinceEpoch / 1000,
        'sunset': sunset.millisecondsSinceEpoch / 1000,
      }
    };
    if (clouds != null)
      result['clouds'] = clouds.toJson();
    if (wind != null)
      result['wind'] = wind.toJson();
    if (rain != null)
      result['rain'] = rain.toJson();
    if (snow != null)
      result['snow'] = snow.toJson();
    return result;
  }
}

class ForecastStat {
  /// A number of timestamps returned in the API response
  int cnt;
  List<ForecastWeather> list;
  City city;

  ForecastStat({
    this.cnt,
    this.list,
    this.city
  });

  static ForecastStat fromJson(Map<String, dynamic> json) {
    return ForecastStat(
      cnt: json['cnt'],
      list: ForecastWeather.fromListJson(json['list']),
      city: City.fromJson(json['city'])
    );
  }

  Map<String, dynamic> toJson() => {
    'cnt': cnt,
    'list': list.map((e) => e.toJson()).toList(),
    'city': city.toJson()
  };
}

class ForecastWeather {
  /// Time of data forecasted, UTC
  DateTime dt;
  /// Main weather stats
  ForecastMainWeather main;
  /// Weather condition
  WeatherCondition weather;
  /// Cloudiness, %
  Cloud clouds;
  /// Wind
  Wind wind;
  /// Average visibility, metres
  double visibility;
  /// Probability of precipitation
  double probability;
  /// (where available) Rain volume for last 3 hours, mm
  Rain rain;
  /// (where available) Snow volume for last 3 hours
  Snow snow;
  /// Part of the day (n - night, d - day)
  String partOfDay;

  ForecastWeather({
    this.dt,
    this.main,
    this.weather,
    this.clouds,
    this.wind,
    this.visibility,
    this.probability,
    this.rain,
    this.snow,
    this.partOfDay
  });

  /// Convert Json to ForecastWeather
  static ForecastWeather fromJson(Map<String, dynamic> json) {
    return ForecastWeather(
      dt: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000),
      main: ForecastMainWeather.fromJson(json['main']),
      weather: WeatherCondition.fromJson(json['weather'][0]),
      clouds: json['clouds'] != null ? Cloud.fromJson(json['clouds']) : null,
      wind: json['wind'] != null ? Wind.fromJson(json['wind']) : null,
      visibility: intToDouble(json['visibility']),
      probability: intToDouble(json['pop']),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      snow: json['snow'] != null ? Snow.fromJson(json['snow']) : null,
      partOfDay: json['sys']['pod']
    );
  }

  /// Convert json to a list of ForecastWeather objects
  static List<ForecastWeather> fromListJson(List json) {
    final weathers = List<ForecastWeather>();
    for (final item in json) {
      weathers.add(ForecastWeather.fromJson(item));
    }
    return weathers;
  }

  Map<String, dynamic> toJson() {
    var result = {
      'dt': dt.millisecondsSinceEpoch / 1000,
      'main': main.toJson(),
      'weather': [ weather.toJson() ],
      'visibility': visibility,
      'pop': probability,
      'sys': {
        'pod': partOfDay
      }
    };
    if (clouds != null)
      result['clouds'] = clouds.toJson();
    if (wind != null)
      result['wind'] = wind.toJson();
    if (rain != null)
      result['rain'] = rain.toJson();
    if (snow != null)
      result['snow'] = snow.toJson();
    return result;
  }
}

class ForecastMainWeather {
  /// Temperature.
  /// Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  Temperature temp;
  /// This temperature parameter accounts for the human perception of weather.
  /// Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  Temperature feelsLike;
  /// Minimum temperature at the moment of calculation.
  /// This is minimal forecasted temperature (within large megalopolises and urban areas), use this parameter optionally.
  /// Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  Temperature tempMin;
  /// Maximum temperature at the moment of calculation.
  /// This is maximal forecasted temperature (within large megalopolises and urban areas), use this parameter optionally.
  /// Unit Default: Kelvin, Metric: Celsius, Imperial: Fahrenheit.
  Temperature tempMax;
  /// Atmospheric pressure on the sea level by default, hPa
  double pressure;
  /// Atmospheric pressure on the sea level, hPa
  double seaLevel;
  /// Atmospheric pressure on the ground level, hPa
  double groundLevel;
  /// Humidity, %
  double humidity;

  ForecastMainWeather({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.seaLevel,
    this.groundLevel,
    this.humidity
  });

  /// Convert Json to ForecastMainWeather
  static ForecastMainWeather fromJson(Map<String, dynamic> json) {
    return ForecastMainWeather(
      temp: Temperature(intToDouble(json['temp'])),
      feelsLike: Temperature(intToDouble(json['feels_like'])),
      tempMin: json['temp_min'] != null ? Temperature(intToDouble(json['temp_min'])) : null,
      tempMax: json['temp_max'] != null ? Temperature(intToDouble(json['temp_max'])) : null,
      pressure: intToDouble(json['pressure']),
      seaLevel: json['sea_level'] != null ? intToDouble(json['sea_level']) : null,
      groundLevel: json['grnd_level'] != null ? intToDouble(json['grnd_level']) : null,
      humidity: intToDouble(json['humidity']),
    );
  }

  Map<String, dynamic> toJson() {
    var result = {
      'temp': temp.kelvin,
      'feels_like': feelsLike.kelvin,
      'pressure': pressure,
      'humidity': humidity
    };
    if (tempMin != null)
      result['temp_min'] = tempMin.kelvin;
    if (tempMax != null)
      result['temp_max'] = tempMax.kelvin;
    if (seaLevel != null)
      result['sea_level'] = seaLevel;
    if (groundLevel != null)
      result['grnd_level'] = groundLevel;
    return result;
  }
}

class City {
  /// City ID
  final int id;
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
      id: json['id'],
      name: json['name'],
      coordinate: Location.fromJson(json['coord']),
      country: json['country'],
      timezone: json['timezone'],
      sunrise: json['sunrise'] != null ? DateTime.fromMillisecondsSinceEpoch(json['sunrise'] * 1000) : null,
      sunset: json['sunset'] != null ? DateTime.fromMillisecondsSinceEpoch(json['sunset'] * 1000) : null,
    );
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