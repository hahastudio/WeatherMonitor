import 'package:flutter/material.dart';
import 'package:strings/strings.dart';
import 'package:weather_monitor/model/models.dart';

class WeatherSummaryWidget extends StatelessWidget {
  final WeatherCondition condition;
  final double temp;
  final double feelsLike;

  WeatherSummaryWidget(
      {Key key,
        @required this.condition,
        @required this.temp,
        @required this.feelsLike})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  '${_formatTemperature(this.temp)}°ᶜ',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Text(
                  'Feels like ${_formatTemperature(this.feelsLike)}°ᶜ',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            _mapWeatherConditionToIcon(this.condition),
          ]
      ),
    );
  }

  String _formatTemperature(double t) {
    var temp = (t == null ? '' : t.round().toString());
    return temp;
  }

  Widget _mapWeatherConditionToIcon(WeatherCondition condition) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Container(
            margin: EdgeInsets.only(bottom: 19),
            child: Icon(
              condition.getIconData(),
              size: 40,
            ),
          ),
        ),
        Center(
          child: Text(capitalize(condition.description),
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            )
          ),
        )
      ],
    );
  }
}