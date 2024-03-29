import 'package:flutter/material.dart';
import 'package:weather_monitor/util/constants.dart';

class LocationWidget extends StatelessWidget {
  final double longitude;
  final double latitude;
  final String city;

  LocationWidget(
      {Key key,
        @required this.longitude,
        @required this.latitude,
        @required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String cityName = this.city;
    if (cityName.startsWith(Constants.GpsPrefix))
      cityName = cityName.substring(14);

    return Center(
      child: Column(children: [
        Text('${cityName.toUpperCase()}',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).textTheme.bodyText1.color,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on,
                color: Theme.of(context).textTheme.bodyText1.color,
                size: 15
            ),
            SizedBox(width: 10),
            Text(this.latitude.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyText1.color,
                )
            ),
            Text(' , ',
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1.color,
              )
            ),
            Text(this.longitude.toString(),
              style: TextStyle(
                fontSize: 16,
                color: Theme.of(context).textTheme.bodyText1.color,
              )
            ),
          ],
        )
      ]),
    );
  }
}