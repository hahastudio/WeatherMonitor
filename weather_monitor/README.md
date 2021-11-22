# Weather Monitor

A weather app that utilizes multiple data sources.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## How to build

### Prepare API Key

This project uses package [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) to store configurations.

Sign up and get API keys from:

- [OpenWeather API](https://openweathermap.org/api)
- [Colorful Clouds API](https://open.caiyunapp.com/ColorfulClouds_Weather_API)

In `.env`, paste api key like:

```
OPENWEATHERMAP_API_KEY=ab1234567890123456789abcdef4321
COLORFULCLOUD_API_KEY=TAkhjf8d1nlSlspN
```

Colorful Clouds API Key can be ignored.

### Prepare city list file

From [OpenWeather samples](https://bulk.openweathermap.org/sample/), download [current.city.list.min.json.gz](https://bulk.openweathermap.org/sample/current.city.list.min.json.gz), unzip and put into `/assets/current.city.list.min.json`.

### Build Flutter project

Get flutter package:

```
flutter pub get
```

Build apk:

```
flutter build apk
```
