import 'package:flutter/material.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/widget/empty_widget.dart';

class WeatherAlertsWidget extends StatelessWidget {
  final List<WeatherAlert> alerts;

  WeatherAlertsWidget(
      {Key key,
        this.alerts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((alerts == null) || (alerts.length == 0))
      return EmptyWidget();
    return Container(
      padding: EdgeInsets.all(10),
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        primary: false,
        itemCount: this.alerts.length,
        separatorBuilder: (context, index) => Padding(
          child: Divider(
              color: Theme.of(context).textTheme.bodyText2.color
          ),
          padding: EdgeInsets.all(10),
        ),
        itemBuilder: (context, index) {
          final item = this.alerts[index];
          return Center(
            child: Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text(item.event),
                    subtitle: Text(
                      item.description,
                      softWrap: true,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}