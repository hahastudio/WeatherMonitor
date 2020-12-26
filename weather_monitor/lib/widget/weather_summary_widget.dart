import 'package:flutter/material.dart';
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
            _mapWeatherConditionToImage(this.condition),
          ]
      ),
    );
  }

  String _formatTemperature(double t) {
    var temp = (t == null ? '' : t.round().toString());
    return temp;
  }

  Widget _mapWeatherConditionToImage(WeatherCondition condition) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Icon(
              condition.getIconData(),
              size: 72,
            ),
          )
        ],
      ),
    );
  }
}