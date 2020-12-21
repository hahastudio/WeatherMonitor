import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_monitor/model/weather.dart';

import 'util/test_util.dart';

void main() {
  test('CurrentWeather serialization test', () {
    var body = '''{
  "coord": {
    "lon": 121.56,
    "lat": 31.25
  },
  "weather": [
    {
      "id": 800,
      "main": "Clear",
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "base": "stations",
  "main": {
    "temp": 7.45,
    "feels_like": 0.08,
    "temp_min": 6.67,
    "temp_max": 8,
    "pressure": 1033,
    "humidity": 45
  },
  "visibility": 10000,
  "wind": {
    "speed": 7,
    "deg": 20
  },
  "clouds": {
    "all": 0
  },
  "dt": 1608365551,
  "sys": {
    "type": 1,
    "id": 9659,
    "country": "CN",
    "sunrise": 1608331646,
    "sunset": 1608368058
  },
  "timezone": 28800,
  "id": 7843569,
  "name": "Jiangnong",
  "cod": 200
}''';
    var currentJson = json.decode(body);
    var c = CurrentWeather.fromJson(currentJson);
    printObject(c.toJson());
  });

  test('ForecastStat serialization test', () {
    var body = '''{
  "cod": "200",
  "message": 0,
  "cnt": 40,
  "list": [
    {
      "dt": 1608454800,
      "main": {
        "temp": 280.83,
        "feels_like": 276.4,
        "temp_min": 280.37,
        "temp_max": 280.83,
        "pressure": 1033,
        "sea_level": 1033,
        "grnd_level": 1034,
        "humidity": 48,
        "temp_kf": 0.46
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 7
      },
      "wind": {
        "speed": 2.99,
        "deg": 4
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-20 09:00:00"
    },
    {
      "dt": 1608465600,
      "main": {
        "temp": 279.63,
        "feels_like": 275.48,
        "temp_min": 279.18,
        "temp_max": 279.63,
        "pressure": 1034,
        "sea_level": 1034,
        "grnd_level": 1033,
        "humidity": 58,
        "temp_kf": 0.45
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 5
      },
      "wind": {
        "speed": 2.85,
        "deg": 24
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-20 12:00:00"
    },
    {
      "dt": 1608476400,
      "main": {
        "temp": 278.93,
        "feels_like": 275.47,
        "temp_min": 278.77,
        "temp_max": 278.93,
        "pressure": 1034,
        "sea_level": 1034,
        "grnd_level": 1034,
        "humidity": 62,
        "temp_kf": 0.16
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 1.92,
        "deg": 1
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-20 15:00:00"
    },
    {
      "dt": 1608487200,
      "main": {
        "temp": 278.09,
        "feels_like": 274.96,
        "temp_min": 278.06,
        "temp_max": 278.09,
        "pressure": 1033,
        "sea_level": 1033,
        "grnd_level": 1032,
        "humidity": 67,
        "temp_kf": 0.03
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 1.5,
        "deg": 325
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-20 18:00:00"
    },
    {
      "dt": 1608498000,
      "main": {
        "temp": 277.62,
        "feels_like": 273.72,
        "temp_min": 277.62,
        "temp_max": 277.62,
        "pressure": 1032,
        "sea_level": 1032,
        "grnd_level": 1032,
        "humidity": 69,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 2.59,
        "deg": 359
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-20 21:00:00"
    },
    {
      "dt": 1608508800,
      "main": {
        "temp": 278.24,
        "feels_like": 274.28,
        "temp_min": 278.24,
        "temp_max": 278.24,
        "pressure": 1033,
        "sea_level": 1033,
        "grnd_level": 1032,
        "humidity": 66,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 2.67,
        "deg": 20
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-21 00:00:00"
    },
    {
      "dt": 1608519600,
      "main": {
        "temp": 281,
        "feels_like": 277.62,
        "temp_min": 281,
        "temp_max": 281,
        "pressure": 1033,
        "sea_level": 1033,
        "grnd_level": 1032,
        "humidity": 52,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 1.72,
        "deg": 30
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-21 03:00:00"
    },
    {
      "dt": 1608530400,
      "main": {
        "temp": 282.38,
        "feels_like": 279.13,
        "temp_min": 282.38,
        "temp_max": 282.38,
        "pressure": 1031,
        "sea_level": 1031,
        "grnd_level": 1030,
        "humidity": 46,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 1.46,
        "deg": 43
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-21 06:00:00"
    },
    {
      "dt": 1608541200,
      "main": {
        "temp": 281.01,
        "feels_like": 277.07,
        "temp_min": 281.01,
        "temp_max": 281.01,
        "pressure": 1030,
        "sea_level": 1030,
        "grnd_level": 1029,
        "humidity": 52,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 2.52,
        "deg": 63
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-21 09:00:00"
    },
    {
      "dt": 1608552000,
      "main": {
        "temp": 280.27,
        "feels_like": 276.93,
        "temp_min": 280.27,
        "temp_max": 280.27,
        "pressure": 1031,
        "sea_level": 1031,
        "grnd_level": 1030,
        "humidity": 55,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 10
      },
      "wind": {
        "speed": 1.68,
        "deg": 119
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-21 12:00:00"
    },
    {
      "dt": 1608562800,
      "main": {
        "temp": 279.73,
        "feels_like": 276.67,
        "temp_min": 279.73,
        "temp_max": 279.73,
        "pressure": 1030,
        "sea_level": 1030,
        "grnd_level": 1030,
        "humidity": 58,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 81
      },
      "wind": {
        "speed": 1.32,
        "deg": 107
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-21 15:00:00"
    },
    {
      "dt": 1608573600,
      "main": {
        "temp": 279.17,
        "feels_like": 276.43,
        "temp_min": 279.17,
        "temp_max": 279.17,
        "pressure": 1029,
        "sea_level": 1029,
        "grnd_level": 1029,
        "humidity": 61,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 58
      },
      "wind": {
        "speed": 0.89,
        "deg": 144
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-21 18:00:00"
    },
    {
      "dt": 1608584400,
      "main": {
        "temp": 278.85,
        "feels_like": 275.9,
        "temp_min": 278.85,
        "temp_max": 278.85,
        "pressure": 1028,
        "sea_level": 1028,
        "grnd_level": 1027,
        "humidity": 63,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 1
      },
      "wind": {
        "speed": 1.22,
        "deg": 79
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-21 21:00:00"
    },
    {
      "dt": 1608595200,
      "main": {
        "temp": 279.74,
        "feels_like": 276.9,
        "temp_min": 279.74,
        "temp_max": 279.74,
        "pressure": 1029,
        "sea_level": 1029,
        "grnd_level": 1029,
        "humidity": 60,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 35
      },
      "wind": {
        "speed": 1.1,
        "deg": 92
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-22 00:00:00"
    },
    {
      "dt": 1608606000,
      "main": {
        "temp": 282.73,
        "feels_like": 279.14,
        "temp_min": 282.73,
        "temp_max": 282.73,
        "pressure": 1029,
        "sea_level": 1029,
        "grnd_level": 1029,
        "humidity": 50,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 99
      },
      "wind": {
        "speed": 2.22,
        "deg": 79
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-22 03:00:00"
    },
    {
      "dt": 1608616800,
      "main": {
        "temp": 283.82,
        "feels_like": 279.8,
        "temp_min": 283.82,
        "temp_max": 283.82,
        "pressure": 1027,
        "sea_level": 1027,
        "grnd_level": 1026,
        "humidity": 47,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 50
      },
      "wind": {
        "speed": 2.87,
        "deg": 88
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-22 06:00:00"
    },
    {
      "dt": 1608627600,
      "main": {
        "temp": 282.5,
        "feels_like": 278.34,
        "temp_min": 282.5,
        "temp_max": 282.5,
        "pressure": 1027,
        "sea_level": 1027,
        "grnd_level": 1026,
        "humidity": 54,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 3.21,
        "deg": 110
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-22 09:00:00"
    },
    {
      "dt": 1608638400,
      "main": {
        "temp": 282.03,
        "feels_like": 277.97,
        "temp_min": 282.03,
        "temp_max": 282.03,
        "pressure": 1027,
        "sea_level": 1027,
        "grnd_level": 1027,
        "humidity": 58,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01n"
        }
      ],
      "clouds": {
        "all": 0
      },
      "wind": {
        "speed": 3.2,
        "deg": 126
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-22 12:00:00"
    },
    {
      "dt": 1608649200,
      "main": {
        "temp": 281.82,
        "feels_like": 278.05,
        "temp_min": 281.82,
        "temp_max": 281.82,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1026,
        "humidity": 65,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 28
      },
      "wind": {
        "speed": 3.1,
        "deg": 138
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-22 15:00:00"
    },
    {
      "dt": 1608660000,
      "main": {
        "temp": 281.64,
        "feels_like": 278.3,
        "temp_min": 281.64,
        "temp_max": 281.64,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1024,
        "humidity": 71,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 65
      },
      "wind": {
        "speed": 2.77,
        "deg": 129
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-22 18:00:00"
    },
    {
      "dt": 1608670800,
      "main": {
        "temp": 281.63,
        "feels_like": 278.47,
        "temp_min": 281.63,
        "temp_max": 281.63,
        "pressure": 1023,
        "sea_level": 1023,
        "grnd_level": 1023,
        "humidity": 76,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 2.76,
        "deg": 125
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-22 21:00:00"
    },
    {
      "dt": 1608681600,
      "main": {
        "temp": 282.98,
        "feels_like": 279.73,
        "temp_min": 282.98,
        "temp_max": 282.98,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 76,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 98
      },
      "wind": {
        "speed": 3.27,
        "deg": 138
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-23 00:00:00"
    },
    {
      "dt": 1608692400,
      "main": {
        "temp": 287.42,
        "feels_like": 283.74,
        "temp_min": 287.42,
        "temp_max": 287.42,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1022,
        "humidity": 61,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 4.21,
        "deg": 173
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-23 03:00:00"
    },
    {
      "dt": 1608703200,
      "main": {
        "temp": 288.24,
        "feels_like": 284.85,
        "temp_min": 288.24,
        "temp_max": 288.24,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1019,
        "humidity": 57,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 99
      },
      "wind": {
        "speed": 3.73,
        "deg": 217
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-23 06:00:00"
    },
    {
      "dt": 1608714000,
      "main": {
        "temp": 285.2,
        "feels_like": 282.32,
        "temp_min": 285.2,
        "temp_max": 285.2,
        "pressure": 1020,
        "sea_level": 1020,
        "grnd_level": 1020,
        "humidity": 69,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 2.97,
        "deg": 267
      },
      "visibility": 10000,
      "pop": 0.29,
      "rain": {
        "3h": 0.14
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-23 09:00:00"
    },
    {
      "dt": 1608724800,
      "main": {
        "temp": 285.01,
        "feels_like": 281.45,
        "temp_min": 285.01,
        "temp_max": 285.01,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1021,
        "humidity": 57,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "light rain",
          "icon": "10n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 3.1,
        "deg": 294
      },
      "visibility": 10000,
      "pop": 0.26,
      "rain": {
        "3h": 0.17
      },
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-23 12:00:00"
    },
    {
      "dt": 1608735600,
      "main": {
        "temp": 283.56,
        "feels_like": 279.09,
        "temp_min": 283.56,
        "temp_max": 283.56,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1022,
        "humidity": 58,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 4.11,
        "deg": 312
      },
      "visibility": 10000,
      "pop": 0.04,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-23 15:00:00"
    },
    {
      "dt": 1608746400,
      "main": {
        "temp": 282.73,
        "feels_like": 278.13,
        "temp_min": 282.73,
        "temp_max": 282.73,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1022,
        "humidity": 68,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 4.68,
        "deg": 323
      },
      "visibility": 10000,
      "pop": 0.04,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-23 18:00:00"
    },
    {
      "dt": 1608757200,
      "main": {
        "temp": 281.32,
        "feels_like": 277,
        "temp_min": 281.32,
        "temp_max": 281.32,
        "pressure": 1022,
        "sea_level": 1022,
        "grnd_level": 1022,
        "humidity": 76,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 28
      },
      "wind": {
        "speed": 4.34,
        "deg": 334
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-23 21:00:00"
    },
    {
      "dt": 1608768000,
      "main": {
        "temp": 281.25,
        "feels_like": 276.81,
        "temp_min": 281.25,
        "temp_max": 281.25,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1024,
        "humidity": 77,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 48
      },
      "wind": {
        "speed": 4.54,
        "deg": 350
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-24 00:00:00"
    },
    {
      "dt": 1608778800,
      "main": {
        "temp": 283.04,
        "feels_like": 277.96,
        "temp_min": 283.04,
        "temp_max": 283.04,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1024,
        "humidity": 57,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {
        "all": 20
      },
      "wind": {
        "speed": 4.81,
        "deg": 3
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-24 03:00:00"
    },
    {
      "dt": 1608789600,
      "main": {
        "temp": 283.8,
        "feels_like": 278.71,
        "temp_min": 283.8,
        "temp_max": 283.8,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1023,
        "humidity": 46,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "clear sky",
          "icon": "01d"
        }
      ],
      "clouds": {
        "all": 10
      },
      "wind": {
        "speed": 4.33,
        "deg": 2
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-24 06:00:00"
    },
    {
      "dt": 1608800400,
      "main": {
        "temp": 282.22,
        "feels_like": 277.65,
        "temp_min": 282.22,
        "temp_max": 282.22,
        "pressure": 1024,
        "sea_level": 1024,
        "grnd_level": 1024,
        "humidity": 51,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 100
      },
      "wind": {
        "speed": 3.59,
        "deg": 17
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-24 09:00:00"
    },
    {
      "dt": 1608811200,
      "main": {
        "temp": 281.18,
        "feels_like": 277.27,
        "temp_min": 281.18,
        "temp_max": 281.18,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1026,
        "humidity": 55,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 99
      },
      "wind": {
        "speed": 2.66,
        "deg": 18
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-24 12:00:00"
    },
    {
      "dt": 1608822000,
      "main": {
        "temp": 280.59,
        "feels_like": 277.12,
        "temp_min": 280.59,
        "temp_max": 280.59,
        "pressure": 1027,
        "sea_level": 1027,
        "grnd_level": 1026,
        "humidity": 58,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 99
      },
      "wind": {
        "speed": 2.06,
        "deg": 24
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-24 15:00:00"
    },
    {
      "dt": 1608832800,
      "main": {
        "temp": 280.27,
        "feels_like": 276.63,
        "temp_min": 280.27,
        "temp_max": 280.27,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1026,
        "humidity": 59,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "overcast clouds",
          "icon": "04n"
        }
      ],
      "clouds": {
        "all": 95
      },
      "wind": {
        "speed": 2.29,
        "deg": 25
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-24 18:00:00"
    },
    {
      "dt": 1608843600,
      "main": {
        "temp": 279.79,
        "feels_like": 276.45,
        "temp_min": 279.79,
        "temp_max": 279.79,
        "pressure": 1026,
        "sea_level": 1026,
        "grnd_level": 1026,
        "humidity": 59,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03n"
        }
      ],
      "clouds": {
        "all": 31
      },
      "wind": {
        "speed": 1.77,
        "deg": 29
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "n"
      },
      "dt_txt": "2020-12-24 21:00:00"
    },
    {
      "dt": 1608854400,
      "main": {
        "temp": 280.55,
        "feels_like": 277.17,
        "temp_min": 280.55,
        "temp_max": 280.55,
        "pressure": 1027,
        "sea_level": 1027,
        "grnd_level": 1027,
        "humidity": 56,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "few clouds",
          "icon": "02d"
        }
      ],
      "clouds": {
        "all": 16
      },
      "wind": {
        "speed": 1.83,
        "deg": 52
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-25 00:00:00"
    },
    {
      "dt": 1608865200,
      "main": {
        "temp": 283.33,
        "feels_like": 279.2,
        "temp_min": 283.33,
        "temp_max": 283.33,
        "pressure": 1027,
        "sea_level": 1027,
        "grnd_level": 1027,
        "humidity": 46,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "scattered clouds",
          "icon": "03d"
        }
      ],
      "clouds": {
        "all": 33
      },
      "wind": {
        "speed": 2.88,
        "deg": 83
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-25 03:00:00"
    },
    {
      "dt": 1608876000,
      "main": {
        "temp": 284.09,
        "feels_like": 279.58,
        "temp_min": 284.09,
        "temp_max": 284.09,
        "pressure": 1025,
        "sea_level": 1025,
        "grnd_level": 1024,
        "humidity": 44,
        "temp_kf": 0
      },
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "broken clouds",
          "icon": "04d"
        }
      ],
      "clouds": {
        "all": 66
      },
      "wind": {
        "speed": 3.44,
        "deg": 85
      },
      "visibility": 10000,
      "pop": 0,
      "sys": {
        "pod": "d"
      },
      "dt_txt": "2020-12-25 06:00:00"
    }
  ],
  "city": {
    "id": 1798524,
    "name": "Pudong",
    "coord": {
      "lat": 31.2351,
      "lon": 121.5276
    },
    "country": "CN",
    "population": 1000,
    "timezone": 28800,
    "sunrise": 1608418083,
    "sunset": 1608454494
  }
}''';
    var forecastJson = json.decode(body);
    var f = ForecastStat.fromJson(forecastJson);
    printObject(f.toJson());
  });

  test('OverAllWeather serialization test', () {
    var body = '''{
  "lat": 31.25,
  "lon": 121.56,
  "timezone": "Asia/Shanghai",
  "timezone_offset": 28800,
  "current": {
    "dt": 1608394730,
    "sunrise": 1608418078,
    "sunset": 1608454484,
    "temp": 279.12,
    "feels_like": 274.24,
    "pressure": 1030,
    "humidity": 45,
    "dew_point": 268.67,
    "uvi": 0,
    "clouds": 47,
    "visibility": 10000,
    "wind_speed": 3.23,
    "wind_deg": 347,
    "weather": [
      {
        "id": 802,
        "main": "Clouds",
        "description": "多云",
        "icon": "03n"
      }
    ]
  },
  "hourly": [
    {
      "dt": 1608393600,
      "temp": 279.12,
      "feels_like": 274.24,
      "pressure": 1030,
      "humidity": 45,
      "dew_point": 268.67,
      "uvi": 0,
      "clouds": 47,
      "visibility": 10000,
      "wind_speed": 3.23,
      "wind_deg": 347,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "多云",
          "icon": "03n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608397200,
      "temp": 278.82,
      "feels_like": 274.15,
      "pressure": 1032,
      "humidity": 55,
      "dew_point": 270.8,
      "uvi": 0,
      "clouds": 52,
      "visibility": 10000,
      "wind_speed": 3.33,
      "wind_deg": 347,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "多云",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608400800,
      "temp": 278.6,
      "feels_like": 273.88,
      "pressure": 1033,
      "humidity": 62,
      "dew_point": 272.05,
      "uvi": 0,
      "clouds": 60,
      "visibility": 10000,
      "wind_speed": 3.65,
      "wind_deg": 344,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "多云",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608404400,
      "temp": 278.46,
      "feels_like": 273.62,
      "pressure": 1034,
      "humidity": 65,
      "dew_point": 272.51,
      "uvi": 0,
      "clouds": 94,
      "visibility": 10000,
      "wind_speed": 3.93,
      "wind_deg": 347,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608408000,
      "temp": 278.29,
      "feels_like": 273.53,
      "pressure": 1034,
      "humidity": 66,
      "dew_point": 272.55,
      "uvi": 0,
      "clouds": 95,
      "visibility": 10000,
      "wind_speed": 3.82,
      "wind_deg": 351,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608411600,
      "temp": 278.17,
      "feels_like": 273.4,
      "pressure": 1034,
      "humidity": 67,
      "dew_point": 270.99,
      "uvi": 0,
      "clouds": 93,
      "visibility": 10000,
      "wind_speed": 3.85,
      "wind_deg": 350,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608415200,
      "temp": 277.97,
      "feels_like": 273.36,
      "pressure": 1034,
      "humidity": 68,
      "dew_point": 271.06,
      "uvi": 0,
      "clouds": 84,
      "visibility": 10000,
      "wind_speed": 3.63,
      "wind_deg": 348,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "多云",
          "icon": "04n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608418800,
      "temp": 277.8,
      "feels_like": 273.45,
      "pressure": 1034,
      "humidity": 69,
      "dew_point": 271.18,
      "uvi": 0,
      "clouds": 76,
      "visibility": 10000,
      "wind_speed": 3.27,
      "wind_deg": 355,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "多云",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608422400,
      "temp": 278.18,
      "feels_like": 273.84,
      "pressure": 1034,
      "humidity": 67,
      "dew_point": 271.24,
      "uvi": 0.38,
      "clouds": 63,
      "visibility": 10000,
      "wind_speed": 3.24,
      "wind_deg": 355,
      "weather": [
        {
          "id": 803,
          "main": "Clouds",
          "description": "多云",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608426000,
      "temp": 278.84,
      "feels_like": 274.38,
      "pressure": 1035,
      "humidity": 64,
      "dew_point": 271.24,
      "uvi": 1.15,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 3.42,
      "wind_deg": 354,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608429600,
      "temp": 279.48,
      "feels_like": 274.8,
      "pressure": 1036,
      "humidity": 61,
      "dew_point": 271.12,
      "uvi": 2.21,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 3.72,
      "wind_deg": 357,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608433200,
      "temp": 280,
      "feels_like": 275.24,
      "pressure": 1035,
      "humidity": 59,
      "dew_point": 270.84,
      "uvi": 3.11,
      "clouds": 5,
      "visibility": 10000,
      "wind_speed": 3.84,
      "wind_deg": 360,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608436800,
      "temp": 280.41,
      "feels_like": 275.76,
      "pressure": 1035,
      "humidity": 57,
      "dew_point": 270.56,
      "uvi": 3.4,
      "clouds": 5,
      "visibility": 10000,
      "wind_speed": 3.67,
      "wind_deg": 2,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608440400,
      "temp": 280.82,
      "feels_like": 276.5,
      "pressure": 1034,
      "humidity": 55,
      "dew_point": 270.06,
      "uvi": 2.98,
      "clouds": 4,
      "visibility": 10000,
      "wind_speed": 3.18,
      "wind_deg": 5,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608444000,
      "temp": 280.97,
      "feels_like": 276.99,
      "pressure": 1034,
      "humidity": 53,
      "dew_point": 269.43,
      "uvi": 2.01,
      "clouds": 3,
      "visibility": 10000,
      "wind_speed": 2.62,
      "wind_deg": 8,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608447600,
      "temp": 281.02,
      "feels_like": 277.03,
      "pressure": 1033,
      "humidity": 53,
      "dew_point": 269.28,
      "uvi": 0.95,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.64,
      "wind_deg": 9,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608451200,
      "temp": 280.71,
      "feels_like": 276.69,
      "pressure": 1033,
      "humidity": 55,
      "dew_point": 269.75,
      "uvi": 0.26,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.72,
      "wind_deg": 17,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608454800,
      "temp": 280.37,
      "feels_like": 276.08,
      "pressure": 1033,
      "humidity": 57,
      "dew_point": 270.36,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 3.14,
      "wind_deg": 23,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608458400,
      "temp": 280.02,
      "feels_like": 275.4,
      "pressure": 1034,
      "humidity": 59,
      "dew_point": 270.99,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 3.65,
      "wind_deg": 32,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608462000,
      "temp": 279.53,
      "feels_like": 274.93,
      "pressure": 1034,
      "humidity": 61,
      "dew_point": 271.11,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 3.61,
      "wind_deg": 29,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608465600,
      "temp": 279.3,
      "feels_like": 275.14,
      "pressure": 1034,
      "humidity": 62,
      "dew_point": 270.8,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.98,
      "wind_deg": 26,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608469200,
      "temp": 279.14,
      "feels_like": 275.33,
      "pressure": 1034,
      "humidity": 62,
      "dew_point": 270.53,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.45,
      "wind_deg": 24,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608472800,
      "temp": 279.02,
      "feels_like": 275.28,
      "pressure": 1034,
      "humidity": 62,
      "dew_point": 270.36,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.33,
      "wind_deg": 15,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608476400,
      "temp": 278.92,
      "feels_like": 275.26,
      "pressure": 1034,
      "humidity": 63,
      "dew_point": 270.2,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.24,
      "wind_deg": 7,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608480000,
      "temp": 278.76,
      "feels_like": 275.01,
      "pressure": 1034,
      "humidity": 63,
      "dew_point": 270.21,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.35,
      "wind_deg": 2,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608483600,
      "temp": 278.59,
      "feels_like": 274.84,
      "pressure": 1034,
      "humidity": 64,
      "dew_point": 270.42,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.35,
      "wind_deg": 358,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608487200,
      "temp": 278.38,
      "feels_like": 274.71,
      "pressure": 1033,
      "humidity": 65,
      "dew_point": 270.59,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.24,
      "wind_deg": 354,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608490800,
      "temp": 278.19,
      "feels_like": 274.82,
      "pressure": 1033,
      "humidity": 66,
      "dew_point": 270.72,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.82,
      "wind_deg": 349,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608494400,
      "temp": 278.08,
      "feels_like": 274.3,
      "pressure": 1032,
      "humidity": 67,
      "dew_point": 270.92,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.42,
      "wind_deg": 344,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608498000,
      "temp": 277.93,
      "feels_like": 274.34,
      "pressure": 1033,
      "humidity": 68,
      "dew_point": 271,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.16,
      "wind_deg": 352,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608501600,
      "temp": 277.88,
      "feels_like": 273.91,
      "pressure": 1033,
      "humidity": 68,
      "dew_point": 271.11,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.7,
      "wind_deg": 2,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608505200,
      "temp": 277.85,
      "feels_like": 274.11,
      "pressure": 1033,
      "humidity": 69,
      "dew_point": 271.24,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.4,
      "wind_deg": 12,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608508800,
      "temp": 278.56,
      "feels_like": 274.66,
      "pressure": 1033,
      "humidity": 65,
      "dew_point": 271.26,
      "uvi": 0.37,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.61,
      "wind_deg": 26,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608512400,
      "temp": 279.44,
      "feels_like": 275.38,
      "pressure": 1033,
      "humidity": 61,
      "dew_point": 271.13,
      "uvi": 1.11,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.83,
      "wind_deg": 25,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608516000,
      "temp": 280.3,
      "feels_like": 276.65,
      "pressure": 1034,
      "humidity": 58,
      "dew_point": 270.96,
      "uvi": 2.12,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.26,
      "wind_deg": 25,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608519600,
      "temp": 281.02,
      "feels_like": 277.4,
      "pressure": 1033,
      "humidity": 54,
      "dew_point": 270.66,
      "uvi": 2.98,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.16,
      "wind_deg": 32,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608523200,
      "temp": 281.73,
      "feels_like": 278.42,
      "pressure": 1032,
      "humidity": 51,
      "dew_point": 270.2,
      "uvi": 3.22,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.7,
      "wind_deg": 37,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608526800,
      "temp": 282.12,
      "feels_like": 278.82,
      "pressure": 1031,
      "humidity": 50,
      "dew_point": 269.85,
      "uvi": 2.82,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.7,
      "wind_deg": 51,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608530400,
      "temp": 282.27,
      "feels_like": 278.88,
      "pressure": 1031,
      "humidity": 49,
      "dew_point": 269.67,
      "uvi": 1.9,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.8,
      "wind_deg": 49,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608534000,
      "temp": 282.16,
      "feels_like": 278.63,
      "pressure": 1030,
      "humidity": 50,
      "dew_point": 269.73,
      "uvi": 0.92,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.03,
      "wind_deg": 54,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608537600,
      "temp": 281.68,
      "feels_like": 277.77,
      "pressure": 1030,
      "humidity": 52,
      "dew_point": 270.15,
      "uvi": 0.26,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.6,
      "wind_deg": 53,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608541200,
      "temp": 281.08,
      "feels_like": 277.21,
      "pressure": 1030,
      "humidity": 54,
      "dew_point": 270.35,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.53,
      "wind_deg": 60,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608544800,
      "temp": 280.79,
      "feels_like": 276.94,
      "pressure": 1031,
      "humidity": 55,
      "dew_point": 270.63,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.5,
      "wind_deg": 68,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608548400,
      "temp": 280.64,
      "feels_like": 276.82,
      "pressure": 1031,
      "humidity": 56,
      "dew_point": 270.97,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.48,
      "wind_deg": 80,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608552000,
      "temp": 280.49,
      "feels_like": 276.83,
      "pressure": 1031,
      "humidity": 57,
      "dew_point": 271.47,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.27,
      "wind_deg": 96,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608555600,
      "temp": 280.33,
      "feels_like": 276.79,
      "pressure": 1031,
      "humidity": 58,
      "dew_point": 271.91,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.11,
      "wind_deg": 95,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608559200,
      "temp": 280.15,
      "feels_like": 276.94,
      "pressure": 1030,
      "humidity": 59,
      "dew_point": 272.09,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.66,
      "wind_deg": 102,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608562800,
      "temp": 279.99,
      "feels_like": 277.08,
      "pressure": 1030,
      "humidity": 60,
      "dew_point": 272.22,
      "uvi": 0,
      "clouds": 1,
      "visibility": 10000,
      "wind_speed": 1.24,
      "wind_deg": 103,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01n"
        }
      ],
      "pop": 0
    }
  ],
  "daily": [
    {
      "dt": 1608433200,
      "sunrise": 1608418078,
      "sunset": 1608454484,
      "temp": {
        "day": 280,
        "min": 277.8,
        "max": 281.02,
        "night": 278.92,
        "eve": 280.37,
        "morn": 278.17
      },
      "feels_like": {
        "day": 275.24,
        "night": 275.26,
        "eve": 276.08,
        "morn": 273.4
      },
      "pressure": 1035,
      "humidity": 59,
      "dew_point": 270.84,
      "wind_speed": 3.84,
      "wind_deg": 360,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "clouds": 5,
      "pop": 0,
      "uvi": 3.4
    },
    {
      "dt": 1608519600,
      "sunrise": 1608504508,
      "sunset": 1608540912,
      "temp": {
        "day": 281.02,
        "min": 277.85,
        "max": 282.27,
        "night": 279.99,
        "eve": 281.08,
        "morn": 277.93
      },
      "feels_like": {
        "day": 277.4,
        "night": 277.08,
        "eve": 277.21,
        "morn": 274.34
      },
      "pressure": 1033,
      "humidity": 54,
      "dew_point": 270.66,
      "wind_speed": 2.16,
      "wind_deg": 32,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "clouds": 0,
      "pop": 0,
      "uvi": 3.22
    },
    {
      "dt": 1608606000,
      "sunrise": 1608590937,
      "sunset": 1608627341,
      "temp": {
        "day": 282.98,
        "min": 279.44,
        "max": 283.72,
        "night": 281.79,
        "eve": 282.53,
        "morn": 279.44
      },
      "feels_like": {
        "day": 279.2,
        "night": 278.56,
        "eve": 278.31,
        "morn": 276.2
      },
      "pressure": 1029,
      "humidity": 53,
      "dew_point": 273.99,
      "wind_speed": 2.71,
      "wind_deg": 83,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "clouds": 1,
      "pop": 0,
      "uvi": 3.27
    },
    {
      "dt": 1608692400,
      "sunrise": 1608677364,
      "sunset": 1608713771,
      "temp": {
        "day": 287.01,
        "min": 281.63,
        "max": 287.89,
        "night": 284.18,
        "eve": 286.67,
        "morn": 281.78
      },
      "feels_like": {
        "day": 282.83,
        "night": 279.04,
        "eve": 283.52,
        "morn": 278.59
      },
      "pressure": 1023,
      "humidity": 62,
      "dew_point": 280.04,
      "wind_speed": 4.88,
      "wind_deg": 160,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04d"
        }
      ],
      "clouds": 100,
      "pop": 0,
      "uvi": 2.98
    },
    {
      "dt": 1608778800,
      "sunrise": 1608763791,
      "sunset": 1608800202,
      "temp": {
        "day": 282.35,
        "min": 280.35,
        "max": 283.42,
        "night": 280.35,
        "eve": 282,
        "morn": 281.31
      },
      "feels_like": {
        "day": 276.85,
        "night": 275.7,
        "eve": 276.44,
        "morn": 276.07
      },
      "pressure": 1026,
      "humidity": 51,
      "dew_point": 271.61,
      "wind_speed": 4.94,
      "wind_deg": 346,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "多云",
          "icon": "03d"
        }
      ],
      "clouds": 33,
      "pop": 0,
      "uvi": 3
    },
    {
      "dt": 1608865200,
      "sunrise": 1608850215,
      "sunset": 1608886635,
      "temp": {
        "day": 281.65,
        "min": 279.07,
        "max": 282.77,
        "night": 281.67,
        "eve": 281.77,
        "morn": 279.07
      },
      "feels_like": {
        "day": 277.85,
        "night": 277.87,
        "eve": 277.38,
        "morn": 274.9
      },
      "pressure": 1028,
      "humidity": 50,
      "dew_point": 268.48,
      "wind_speed": 2.32,
      "wind_deg": 58,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "clouds": 0,
      "pop": 0,
      "uvi": 3
    },
    {
      "dt": 1608951600,
      "sunrise": 1608936639,
      "sunset": 1608973070,
      "temp": {
        "day": 287.12,
        "min": 281.92,
        "max": 287.99,
        "night": 286.86,
        "eve": 286.9,
        "morn": 281.92
      },
      "feels_like": {
        "day": 283.21,
        "night": 283.61,
        "eve": 282.88,
        "morn": 278.83
      },
      "pressure": 1022,
      "humidity": 62,
      "dew_point": 280.1,
      "wind_speed": 4.52,
      "wind_deg": 155,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "小雨",
          "icon": "10d"
        }
      ],
      "clouds": 0,
      "pop": 0.64,
      "rain": 0.4,
      "uvi": 3
    },
    {
      "dt": 1609038000,
      "sunrise": 1609023060,
      "sunset": 1609059505,
      "temp": {
        "day": 285.02,
        "min": 282.71,
        "max": 286.91,
        "night": 282.71,
        "eve": 284.97,
        "morn": 286.65
      },
      "feels_like": {
        "day": 279.89,
        "night": 277.61,
        "eve": 278.98,
        "morn": 284.29
      },
      "pressure": 1017,
      "humidity": 72,
      "dew_point": 280.23,
      "wind_speed": 6.32,
      "wind_deg": 298,
      "weather": [
        {
          "id": 501,
          "main": "Rain",
          "description": "中雨",
          "icon": "10d"
        }
      ],
      "clouds": 100,
      "pop": 1,
      "rain": 10.92,
      "uvi": 3
    }
  ]
}''';
    var allJson = json.decode(body);
    var o = OverAllWeather.fromJson(allJson);
    printObject(o.toJson());
  });
}