import 'package:flutter/material.dart';

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
    return Center(
      child: Column(children: [
        Text('${this.city.toUpperCase()}',
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on, color: Colors.black, size: 15),
            SizedBox(width: 10),
            Text(this.latitude.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )
            ),
            Text(' , ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              )
            ),
            Text(this.longitude.toString(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              )
            ),
          ],
        )
      ]),
    );
  }
}