import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/widget/widgets.dart';

class ForecastDailyHorizontalWidget extends StatelessWidget {
  final List<Weather> weathers;

  const ForecastDailyHorizontalWidget({
    Key key,
    @required this.weathers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: this.weathers.length,
        separatorBuilder: (context, index) => Divider(
          height: 100,
          color: Theme.of(context).dividerColor,
        ),
        padding: EdgeInsets.only(left: 10, right: 10),
        itemBuilder: (context, index) {
          final item = this.weathers[index];
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Center(
                child: ValueTile(
                  DateFormat('EEE, MMM d').format(item.dt),
                  '${item.tempDaily.max.celsius.toStringAsFixed(1)}°ᶜ ~ ${item.tempDaily.min.celsius.toStringAsFixed(1)}°ᶜ',
                  iconData: item.weather.getIconData(),
                  weather: item
                )),
          );
        },
      ),
    );
  }
}
