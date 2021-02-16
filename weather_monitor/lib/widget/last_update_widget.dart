import 'package:flutter/material.dart';

class LastUpdatedWidget extends StatelessWidget {
  final DateTime lastUpdatedOn;

  LastUpdatedWidget({Key key, @required this.lastUpdatedOn})
      : assert(lastUpdatedOn != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 20.0, left: 00),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.access_time,
              color: Theme.of(context).textTheme.bodyText2.color,
              size: 15,
            ),
            SizedBox(width: 10),
            Text(
                'Last updated on ${TimeOfDay.fromDateTime(this.lastUpdatedOn).format(context)}',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).textTheme.bodyText2.color,
                )
            )
          ]
        )
    );
  }
}