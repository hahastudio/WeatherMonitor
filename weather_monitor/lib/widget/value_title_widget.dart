import 'package:flutter/material.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/widget/widgets.dart';

/// General utility widget used to render a cell divided into three rows
/// First row displays [label]
/// second row displays [iconData]
/// third row displays [value]
class ValueTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData iconData;
  final Weather weather;

  ValueTile(this.label, this.value, {this.iconData, this.weather});

  Future<void> _handleClick(BuildContext context, Weather weather) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          insetPadding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 250.0),
          elevation: 0,
          backgroundColor: Theme.of(context).backgroundColor,
          child: WeatherDetailsWidget(weather: weather),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 16,
          child: TextButton(
            style: TextButton.styleFrom(
              padding: EdgeInsets.zero,
            ),
            onPressed: () { _handleClick(context, this.weather); },
            child: Text(
              this.label,
              style: TextStyle(
                  color: Theme.of(context).textTheme.bodyText1.color
              ),
            )
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Icon(
          iconData,
          color: Theme.of(context).textTheme.bodyText1.color,
          size: 20,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          this.value,
          style:
          TextStyle(color: Theme.of(context).textTheme.bodyText1.color),
        ),
      ],
    );
  }
}
