import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/widget/widgets.dart';

class ForecastHourlyHorizontalWidget extends StatelessWidget {
  final List<Weather> weathers;

  const ForecastHourlyHorizontalWidget({
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
                DateFormat('E ha').format(item.dt),
                '${item.temp.celsius.toStringAsFixed(1)}°ᶜ',
                iconData: item.weather.getIconData(),
                weather: item,
              )
            ),
          );
        },
      ),
    );
  }
}
