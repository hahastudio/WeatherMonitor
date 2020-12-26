import 'dart:convert';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_monitor/model/models.dart';

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
    "dt": 1608951081,
    "sunrise": 1608936639,
    "sunset": 1608973070,
    "temp": 285.14,
    "feels_like": 283.84,
    "pressure": 1021,
    "humidity": 72,
    "dew_point": 280.26,
    "uvi": 3,
    "clouds": 28,
    "visibility": 10000,
    "wind_speed": 0.89,
    "wind_deg": 145,
    "wind_gust": 1.79,
    "weather": [
      {
        "id": 802,
        "main": "Clouds",
        "description": "多云",
        "icon": "03d"
      }
    ]
  },
  "hourly": [
    {
      "dt": 1608948000,
      "temp": 285.14,
      "feels_like": 281.43,
      "pressure": 1021,
      "humidity": 72,
      "dew_point": 280.26,
      "uvi": 2.14,
      "clouds": 28,
      "visibility": 10000,
      "wind_speed": 4.33,
      "wind_deg": 129,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "多云",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608951600,
      "temp": 285.61,
      "feels_like": 281.54,
      "pressure": 1022,
      "humidity": 63,
      "dew_point": 278.77,
      "uvi": 3,
      "clouds": 23,
      "visibility": 10000,
      "wind_speed": 4.39,
      "wind_deg": 130,
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "晴，少云",
          "icon": "02d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608955200,
      "temp": 286.32,
      "feels_like": 281.99,
      "pressure": 1022,
      "humidity": 57,
      "dew_point": 278,
      "uvi": 2.99,
      "clouds": 22,
      "visibility": 10000,
      "wind_speed": 4.53,
      "wind_deg": 133,
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "晴，少云",
          "icon": "02d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608958800,
      "temp": 286.78,
      "feels_like": 282.41,
      "pressure": 1021,
      "humidity": 55,
      "dew_point": 277.92,
      "uvi": 2.61,
      "clouds": 28,
      "visibility": 10000,
      "wind_speed": 4.57,
      "wind_deg": 134,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "多云",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608962400,
      "temp": 286.83,
      "feels_like": 282.5,
      "pressure": 1020,
      "humidity": 55,
      "dew_point": 277.96,
      "uvi": 1.76,
      "clouds": 41,
      "visibility": 10000,
      "wind_speed": 4.53,
      "wind_deg": 137,
      "weather": [
        {
          "id": 802,
          "main": "Clouds",
          "description": "多云",
          "icon": "03d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608966000,
      "temp": 286.46,
      "feels_like": 282.26,
      "pressure": 1020,
      "humidity": 58,
      "dew_point": 278.41,
      "uvi": 0.39,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 4.45,
      "wind_deg": 141,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1608969600,
      "temp": 286.05,
      "feels_like": 282.13,
      "pressure": 1021,
      "humidity": 61,
      "dew_point": 278.85,
      "uvi": 0.11,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 4.15,
      "wind_deg": 146,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04d"
        }
      ],
      "pop": 0.03
    },
    {
      "dt": 1608973200,
      "temp": 285.77,
      "feels_like": 281.95,
      "pressure": 1021,
      "humidity": 66,
      "dew_point": 279.64,
      "uvi": 0,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 4.28,
      "wind_deg": 150,
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
      "dt": 1608976800,
      "temp": 285.5,
      "feels_like": 281.86,
      "pressure": 1021,
      "humidity": 69,
      "dew_point": 280.12,
      "uvi": 0,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 4.15,
      "wind_deg": 153,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04n"
        }
      ],
      "pop": 0.08
    },
    {
      "dt": 1608980400,
      "temp": 285.35,
      "feels_like": 281.88,
      "pressure": 1021,
      "humidity": 72,
      "dew_point": 280.58,
      "uvi": 0,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 4.06,
      "wind_deg": 156,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04n"
        }
      ],
      "pop": 0.04
    },
    {
      "dt": 1608984000,
      "temp": 285.12,
      "feels_like": 281.82,
      "pressure": 1020,
      "humidity": 77,
      "dew_point": 281.27,
      "uvi": 0,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 4.07,
      "wind_deg": 159,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "小雨",
          "icon": "10n"
        }
      ],
      "pop": 0.27,
      "rain": {
        "1h": 0.14
      }
    },
    {
      "dt": 1608987600,
      "temp": 285.06,
      "feels_like": 282,
      "pressure": 1020,
      "humidity": 80,
      "dew_point": 281.76,
      "uvi": 0,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 3.91,
      "wind_deg": 163,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "小雨",
          "icon": "10n"
        }
      ],
      "pop": 0.99,
      "rain": {
        "1h": 0.29
      }
    },
    {
      "dt": 1608991200,
      "temp": 284.97,
      "feels_like": 282.13,
      "pressure": 1020,
      "humidity": 83,
      "dew_point": 282.21,
      "uvi": 0,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 3.76,
      "wind_deg": 167,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "小雨",
          "icon": "10n"
        }
      ],
      "pop": 1,
      "rain": {
        "1h": 0.36
      }
    },
    {
      "dt": 1608994800,
      "temp": 284.94,
      "feels_like": 282.59,
      "pressure": 1020,
      "humidity": 84,
      "dew_point": 282.49,
      "uvi": 0,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 3.11,
      "wind_deg": 172,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "小雨",
          "icon": "10n"
        }
      ],
      "pop": 1,
      "rain": {
        "1h": 0.39
      }
    },
    {
      "dt": 1608998400,
      "temp": 284.99,
      "feels_like": 283.23,
      "pressure": 1020,
      "humidity": 84,
      "dew_point": 282.53,
      "uvi": 0,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 2.29,
      "wind_deg": 181,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "小雨",
          "icon": "10n"
        }
      ],
      "pop": 0.89,
      "rain": {
        "1h": 0.29
      }
    },
    {
      "dt": 1609002000,
      "temp": 284.97,
      "feels_like": 283.5,
      "pressure": 1019,
      "humidity": 85,
      "dew_point": 282.59,
      "uvi": 0,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 1.93,
      "wind_deg": 179,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04n"
        }
      ],
      "pop": 0.89
    },
    {
      "dt": 1609005600,
      "temp": 284.46,
      "feels_like": 283.21,
      "pressure": 1019,
      "humidity": 88,
      "dew_point": 282.61,
      "uvi": 0,
      "clouds": 94,
      "visibility": 10000,
      "wind_speed": 1.62,
      "wind_deg": 193,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04n"
        }
      ],
      "pop": 0.89
    },
    {
      "dt": 1609009200,
      "temp": 284.07,
      "feels_like": 282.88,
      "pressure": 1018,
      "humidity": 90,
      "dew_point": 282.66,
      "uvi": 0,
      "clouds": 5,
      "visibility": 10000,
      "wind_speed": 1.51,
      "wind_deg": 223,
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
      "dt": 1609012800,
      "temp": 283.85,
      "feels_like": 282.61,
      "pressure": 1018,
      "humidity": 91,
      "dew_point": 282.53,
      "uvi": 0,
      "clouds": 32,
      "visibility": 10000,
      "wind_speed": 1.57,
      "wind_deg": 253,
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
      "dt": 1609016400,
      "temp": 283.77,
      "feels_like": 282.09,
      "pressure": 1018,
      "humidity": 88,
      "dew_point": 282.04,
      "uvi": 0,
      "clouds": 54,
      "visibility": 10000,
      "wind_speed": 1.98,
      "wind_deg": 283,
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
      "dt": 1609020000,
      "temp": 283.71,
      "feels_like": 282.26,
      "pressure": 1019,
      "humidity": 86,
      "dew_point": 281.5,
      "uvi": 0,
      "clouds": 66,
      "visibility": 10000,
      "wind_speed": 1.52,
      "wind_deg": 301,
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
      "dt": 1609023600,
      "temp": 283.82,
      "feels_like": 281.75,
      "pressure": 1019,
      "humidity": 83,
      "dew_point": 281.11,
      "uvi": 0,
      "clouds": 72,
      "visibility": 10000,
      "wind_speed": 2.26,
      "wind_deg": 302,
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
      "dt": 1609027200,
      "temp": 283.96,
      "feels_like": 281.34,
      "pressure": 1019,
      "humidity": 80,
      "dew_point": 280.84,
      "uvi": 0.37,
      "clouds": 77,
      "visibility": 10000,
      "wind_speed": 2.91,
      "wind_deg": 324,
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
      "dt": 1609030800,
      "temp": 284.04,
      "feels_like": 281.47,
      "pressure": 1020,
      "humidity": 78,
      "dew_point": 280.52,
      "uvi": 0.21,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 2.74,
      "wind_deg": 323,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04d"
        }
      ],
      "pop": 0.04
    },
    {
      "dt": 1609034400,
      "temp": 284.02,
      "feels_like": 281.9,
      "pressure": 1020,
      "humidity": 76,
      "dew_point": 280.04,
      "uvi": 0.4,
      "clouds": 100,
      "visibility": 10000,
      "wind_speed": 1.97,
      "wind_deg": 322,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609038000,
      "temp": 285.79,
      "feels_like": 283.23,
      "pressure": 1020,
      "humidity": 65,
      "dew_point": 279.48,
      "uvi": 0.56,
      "clouds": 98,
      "visibility": 10000,
      "wind_speed": 2.41,
      "wind_deg": 314,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609041600,
      "temp": 286.8,
      "feels_like": 283.95,
      "pressure": 1019,
      "humidity": 60,
      "dew_point": 279.26,
      "uvi": 2.46,
      "clouds": 90,
      "visibility": 10000,
      "wind_speed": 2.77,
      "wind_deg": 320,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609045200,
      "temp": 287.19,
      "feels_like": 283.64,
      "pressure": 1019,
      "humidity": 56,
      "dew_point": 278.71,
      "uvi": 2.15,
      "clouds": 88,
      "visibility": 10000,
      "wind_speed": 3.58,
      "wind_deg": 324,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609048800,
      "temp": 287.19,
      "feels_like": 283.15,
      "pressure": 1019,
      "humidity": 53,
      "dew_point": 277.92,
      "uvi": 1.46,
      "clouds": 85,
      "visibility": 10000,
      "wind_speed": 4.06,
      "wind_deg": 323,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609052400,
      "temp": 286.45,
      "feels_like": 282.6,
      "pressure": 1019,
      "humidity": 54,
      "dew_point": 277.45,
      "uvi": 0.88,
      "clouds": 89,
      "visibility": 10000,
      "wind_speed": 3.67,
      "wind_deg": 325,
      "weather": [
        {
          "id": 804,
          "main": "Clouds",
          "description": "阴，多云",
          "icon": "04d"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609056000,
      "temp": 286.37,
      "feels_like": 282.75,
      "pressure": 1019,
      "humidity": 53,
      "dew_point": 277.19,
      "uvi": 0.24,
      "clouds": 53,
      "visibility": 10000,
      "wind_speed": 3.24,
      "wind_deg": 323,
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
      "dt": 1609059600,
      "temp": 285.82,
      "feels_like": 282.49,
      "pressure": 1020,
      "humidity": 56,
      "dew_point": 277.37,
      "uvi": 0,
      "clouds": 35,
      "visibility": 10000,
      "wind_speed": 2.9,
      "wind_deg": 322,
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
      "dt": 1609063200,
      "temp": 285.51,
      "feels_like": 282.64,
      "pressure": 1020,
      "humidity": 59,
      "dew_point": 277.88,
      "uvi": 0,
      "clouds": 26,
      "visibility": 10000,
      "wind_speed": 2.37,
      "wind_deg": 313,
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
      "dt": 1609066800,
      "temp": 285.22,
      "feels_like": 282.85,
      "pressure": 1021,
      "humidity": 61,
      "dew_point": 278.16,
      "uvi": 0,
      "clouds": 22,
      "visibility": 10000,
      "wind_speed": 1.72,
      "wind_deg": 312,
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "晴，少云",
          "icon": "02n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609070400,
      "temp": 284.82,
      "feels_like": 282.49,
      "pressure": 1022,
      "humidity": 64,
      "dew_point": 278.39,
      "uvi": 0,
      "clouds": 18,
      "visibility": 10000,
      "wind_speed": 1.75,
      "wind_deg": 340,
      "weather": [
        {
          "id": 801,
          "main": "Clouds",
          "description": "晴，少云",
          "icon": "02n"
        }
      ],
      "pop": 0
    },
    {
      "dt": 1609074000,
      "temp": 284.33,
      "feels_like": 282.16,
      "pressure": 1022,
      "humidity": 69,
      "dew_point": 278.89,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.7,
      "wind_deg": 5,
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
      "dt": 1609077600,
      "temp": 283.89,
      "feels_like": 282.09,
      "pressure": 1022,
      "humidity": 74,
      "dew_point": 279.5,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.35,
      "wind_deg": 8,
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
      "dt": 1609081200,
      "temp": 283.59,
      "feels_like": 281.92,
      "pressure": 1023,
      "humidity": 77,
      "dew_point": 279.86,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.26,
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
      "dt": 1609084800,
      "temp": 283.35,
      "feels_like": 281.83,
      "pressure": 1023,
      "humidity": 79,
      "dew_point": 279.9,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.08,
      "wind_deg": 339,
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
      "dt": 1609088400,
      "temp": 283.19,
      "feels_like": 281.44,
      "pressure": 1023,
      "humidity": 79,
      "dew_point": 279.76,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.36,
      "wind_deg": 304,
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
      "dt": 1609092000,
      "temp": 283.03,
      "feels_like": 280.9,
      "pressure": 1022,
      "humidity": 78,
      "dew_point": 279.55,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 1.8,
      "wind_deg": 327,
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
      "dt": 1609095600,
      "temp": 282.84,
      "feels_like": 280.39,
      "pressure": 1022,
      "humidity": 78,
      "dew_point": 279.36,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.2,
      "wind_deg": 340,
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
      "dt": 1609099200,
      "temp": 282.68,
      "feels_like": 279.82,
      "pressure": 1021,
      "humidity": 80,
      "dew_point": 279.4,
      "uvi": 0,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 2.85,
      "wind_deg": 1,
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
      "dt": 1609102800,
      "temp": 282.63,
      "feels_like": 280.12,
      "pressure": 1021,
      "humidity": 86,
      "dew_point": 280.45,
      "uvi": 0,
      "clouds": 1,
      "visibility": 10000,
      "wind_speed": 2.67,
      "wind_deg": 12,
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
      "dt": 1609106400,
      "temp": 282.66,
      "feels_like": 280.55,
      "pressure": 1021,
      "humidity": 90,
      "dew_point": 281.25,
      "uvi": 0,
      "clouds": 1,
      "visibility": 10000,
      "wind_speed": 2.34,
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
      "dt": 1609110000,
      "temp": 282.88,
      "feels_like": 280.39,
      "pressure": 1021,
      "humidity": 92,
      "dew_point": 281.73,
      "uvi": 0,
      "clouds": 1,
      "visibility": 10000,
      "wind_speed": 3.07,
      "wind_deg": 38,
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
      "dt": 1609113600,
      "temp": 283.75,
      "feels_like": 281.07,
      "pressure": 1022,
      "humidity": 89,
      "dew_point": 282.04,
      "uvi": 0.38,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 3.47,
      "wind_deg": 44,
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
      "dt": 1609117200,
      "temp": 284.97,
      "feels_like": 281.93,
      "pressure": 1022,
      "humidity": 82,
      "dew_point": 282.06,
      "uvi": 1.18,
      "clouds": 0,
      "visibility": 10000,
      "wind_speed": 3.98,
      "wind_deg": 48,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "pop": 0
    }
  ],
  "daily": [
    {
      "dt": 1608951600,
      "sunrise": 1608936639,
      "sunset": 1608973070,
      "temp": {
        "day": 285.61,
        "min": 281.1,
        "max": 286.83,
        "night": 284.94,
        "eve": 285.77,
        "morn": 281.46
      },
      "feels_like": {
        "day": 281.54,
        "night": 282.59,
        "eve": 281.95,
        "morn": 277.91
      },
      "pressure": 1022,
      "humidity": 63,
      "dew_point": 278.77,
      "wind_speed": 4.39,
      "wind_deg": 130,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "小雨",
          "icon": "10d"
        }
      ],
      "clouds": 23,
      "pop": 1,
      "rain": 1.18,
      "uvi": 3
    },
    {
      "dt": 1609038000,
      "sunrise": 1609023060,
      "sunset": 1609059505,
      "temp": {
        "day": 285.79,
        "min": 283.59,
        "max": 287.19,
        "night": 283.59,
        "eve": 285.82,
        "morn": 283.77
      },
      "feels_like": {
        "day": 283.23,
        "night": 281.92,
        "eve": 282.49,
        "morn": 282.09
      },
      "pressure": 1020,
      "humidity": 65,
      "dew_point": 279.48,
      "wind_speed": 2.41,
      "wind_deg": 314,
      "weather": [
        {
          "id": 500,
          "main": "Rain",
          "description": "小雨",
          "icon": "10d"
        }
      ],
      "clouds": 98,
      "pop": 0.89,
      "rain": 0.29,
      "uvi": 2.46
    },
    {
      "dt": 1609124400,
      "sunrise": 1609109481,
      "sunset": 1609145942,
      "temp": {
        "day": 286.83,
        "min": 282.63,
        "max": 287.65,
        "night": 284.71,
        "eve": 286.73,
        "morn": 282.63
      },
      "feels_like": {
        "day": 283.99,
        "night": 283.73,
        "eve": 284.94,
        "morn": 280.12
      },
      "pressure": 1022,
      "humidity": 74,
      "dew_point": 282.36,
      "wind_speed": 3.8,
      "wind_deg": 62,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "clouds": 7,
      "pop": 0.18,
      "uvi": 3.17
    },
    {
      "dt": 1609210800,
      "sunrise": 1609195900,
      "sunset": 1609232380,
      "temp": {
        "day": 285.15,
        "min": 277.46,
        "max": 285.37,
        "night": 277.46,
        "eve": 282,
        "morn": 285.37
      },
      "feels_like": {
        "day": 281.36,
        "night": 269.63,
        "eve": 274.34,
        "morn": 284.37
      },
      "pressure": 1021,
      "humidity": 82,
      "dew_point": 282.35,
      "wind_speed": 5.11,
      "wind_deg": 44,
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
      "rain": 10.23,
      "uvi": 1.8
    },
    {
      "dt": 1609297200,
      "sunrise": 1609282317,
      "sunset": 1609318819,
      "temp": {
        "day": 274.34,
        "min": 270.82,
        "max": 276.59,
        "night": 270.82,
        "eve": 272.65,
        "morn": 275.9
      },
      "feels_like": {
        "day": 265.92,
        "night": 262.96,
        "eve": 264.2,
        "morn": 267.83
      },
      "pressure": 1034,
      "humidity": 72,
      "dew_point": 261.86,
      "wind_speed": 8.57,
      "wind_deg": 329,
      "weather": [
        {
          "id": 600,
          "main": "Snow",
          "description": "小雪",
          "icon": "13d"
        }
      ],
      "clouds": 36,
      "pop": 1,
      "snow": 0.8,
      "uvi": 3.6
    },
    {
      "dt": 1609383600,
      "sunrise": 1609368733,
      "sunset": 1609405259,
      "temp": {
        "day": 272.2,
        "min": 270.3,
        "max": 273.75,
        "night": 272.98,
        "eve": 273.75,
        "morn": 270.3
      },
      "feels_like": {
        "day": 265.65,
        "night": 268.07,
        "eve": 267.82,
        "morn": 263.35
      },
      "pressure": 1034,
      "humidity": 67,
      "dew_point": 255.19,
      "wind_speed": 5.44,
      "wind_deg": 315,
      "weather": [
        {
          "id": 800,
          "main": "Clear",
          "description": "晴",
          "icon": "01d"
        }
      ],
      "clouds": 0,
      "pop": 0.01,
      "uvi": 4
    },
    {
      "dt": 1609470000,
      "sunrise": 1609455147,
      "sunset": 1609491701,
      "temp": {
        "day": 276.1,
        "min": 272.49,
        "max": 278.13,
        "night": 276.93,
        "eve": 277.58,
        "morn": 272.49
      },
      "feels_like": {
        "day": 273.36,
        "night": 273.6,
        "eve": 273.44,
        "morn": 268.78
      },
      "pressure": 1031,
      "humidity": 59,
      "dew_point": 258.99,
      "wind_speed": 0.3,
      "wind_deg": 18,
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
      "uvi": 4
    },
    {
      "dt": 1609556400,
      "sunrise": 1609541559,
      "sunset": 1609578143,
      "temp": {
        "day": 281.98,
        "min": 277.01,
        "max": 283.62,
        "night": 282.23,
        "eve": 283.14,
        "morn": 277.3
      },
      "feels_like": {
        "day": 278.18,
        "night": 278.56,
        "eve": 279.25,
        "morn": 273.78
      },
      "pressure": 1028,
      "humidity": 57,
      "dew_point": 274.14,
      "wind_speed": 2.76,
      "wind_deg": 66,
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
      "uvi": 4
    }
  ]
}''';
    var allJson = json.decode(body);
    var o = OverAllWeather.fromJson(allJson);
    printObject(o.toJson());
  });
}