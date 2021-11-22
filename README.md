# Weather Monitor

A weather app that utilizes multiple data sources. It uses [OpenWeather API](https://openweathermap.org/api) and [Colorful Clouds API](https://open.caiyunapp.com/ColorfulClouds_Weather_API). This project is highly inspired by [Flutter Weather Tutorial](https://bloclibrary.dev/#/flutterweathertutorial). 

## Screenshots

![Screenshot 1](/Doc/Screenshot01.png)
![Screenshot 2](/Doc/Screenshot02.png)

## Architecture

It uses [Flutter framework](https://flutter.dev/), and uses [BLoC pattern](https://pub.dev/packages/flutter_bloc) to implement state management.

## Weather services

- [OpenWeather API](https://openweathermap.org/api)
- [Colorful Clouds API](https://open.caiyunapp.com/ColorfulClouds_Weather_API)
- [earth.nullschool.net](https://earth.nullschool.net/)

## How to build

Follow [Project Readme](/weather_monitor/README.md).

## References

Mainly used Flutter packages:

- [flutter_dotenv](https://pub.dev/packages/flutter_dotenv) to store configurations
- [shared_preferences](https://pub.dev/packages/shared_preferences) to store app settings
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) for state management
- [charts_flutter](https://pub.dev/packages/charts_flutter) to render charts
- [flutter_settings_screens](https://pub.dev/packages/flutter_settings_screens) for setting page
- [webview_flutter](https://pub.dev/packages/webview_flutter) to embed wind map
- [flutter_local_notifications](https://pub.dev/packages/flutter_local_notifications) to send weather alert notification
- [location](https://pub.dev/packages/location) to get current location
- [workmanager](https://pub.dev/packages/workmanager) for background fetch

Weather Glyph Font:

- [Weather Icons](https://erikflowers.github.io/weather-icons/)

## License

Distributed under the MIT License. See [LICENSE](LICENSE) for more information.