import 'package:flutter/material.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/util/weather_icon_map.dart';
import 'package:weather_monitor/widget/conditional_widget.dart';

class WeatherDetailsWidget extends StatelessWidget {
  final Weather weather;

  WeatherDetailsWidget(
      {Key key,
        @required this.weather})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConditionalWidget(
                  condition: this.weather.wind.speed != null,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 5),
                        child: Icon(WeatherIcons.wind, size: 15),
                      ),
                      SizedBox(width: 10),
                      Text('Wind: ${this.weather.wind.speed} m/s, ${this.weather.wind.deg}°',
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).textTheme.bodyText1.color,
                          )
                      ),
                    ],
                  )
              ),
              ConditionalWidget(
                  condition: this.weather.wind.speed != null,
                  child: SizedBox(height: 10),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Icon(WeatherIcons.cloudiness, size: 15),
                  ),
                  SizedBox(width: 10),
                  Text('Cloudiness: ${this.weather.clouds}%',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyText1.color,
                      )
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Icon(WeatherIcons.pressure, size: 15),
                  ),
                  SizedBox(width: 10),
                  Text('Pressure: ${this.weather.pressure} hPa',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyText1.color,
                      )
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Icon(WeatherIcons.humidity, size: 15),
                  ),
                  SizedBox(width: 10),
                  Text('Humidity: ${this.weather.humidity}%',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyText1.color,
                      )
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Icon(WeatherIcons.sunrise, size: 15),
                  ),
                  SizedBox(width: 10),
                  Text('Sunrise: ${TimeOfDay.fromDateTime(this.weather.sunrise).format(context)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyText1.color,
                      )
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 5),
                    child: Icon(WeatherIcons.sunset, size: 15),
                  ),
                  SizedBox(width: 10),
                  Text('Sunset: ${TimeOfDay.fromDateTime(this.weather.sunset).format(context)}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).textTheme.bodyText1.color,
                      )
                  ),
                ],
              ),
            ]
        ),
      ),
    );
  }
}