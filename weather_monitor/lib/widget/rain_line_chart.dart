import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:weather_monitor/model/models.dart';

/// Renders a line chart from forecast data
/// x axis - date
/// y axis - rain/snow volume
class RainLineChart extends StatelessWidget {

  final List<Weather> weathers;
  final bool animate;

  RainLineChart(this.weathers, {this.animate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Rain/snow volume (mm)",
        ),
        Container(
          height: 300,
          child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: charts.TimeSeriesChart(
                  [
                    new charts.Series<Weather, DateTime>(
                      id: 'Rain',
                      colorFn: (_, __) =>
                      charts.MaterialPalette.blue.shadeDefault,
                      domainFn: (Weather weather, _) => weather.dt,
                      measureFn: (Weather weather, _) {
                        if (weather.rain != null) {
                          return weather.rain;
                        }
                        if (weather.rainVolumes != null) {
                          if (weather.rainVolumes.volume['1h'] != null)
                            return weather.rainVolumes.volume['1h'];
                          if (weather.rainVolumes.volume['3h'] != null)
                            return weather.rainVolumes.volume['3h'];
                        }
                        if (weather.snow != null) {
                          return weather.snow;
                        }
                        if (weather.snowVolumes != null) {
                          if (weather.snowVolumes.volume['1h'] != null)
                            return weather.snowVolumes.volume['1h'];
                          if (weather.snowVolumes.volume['3h'] != null)
                            return weather.snowVolumes.volume['3h'];
                        }
                        return 0;
                      },
                      data: weathers,
                    )
                  ],
                  animate: animate,
                  animationDuration: Duration(milliseconds: 500),
                  primaryMeasureAxis: new charts.NumericAxisSpec(
                      tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                          zeroBound: false
                      )
                  )
              )
          ),
        )
      ],
    );
  }
}