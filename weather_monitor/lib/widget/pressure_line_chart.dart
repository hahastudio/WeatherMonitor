import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:weather_monitor/model/models.dart';

/// Renders a line chart from forecast data
/// x axis - date
/// y axis - pressure
class PressureLineChart extends StatelessWidget {

  final List<Weather> weathers;
  final bool animate;

  PressureLineChart(this.weathers, {this.animate});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          "Atmospheric Pressure (hPa)",
        ),
        Container(
          height: 300,
          child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: charts.TimeSeriesChart(
                  [
                    new charts.Series<Weather, DateTime>(
                      id: 'Pressure',
                      colorFn: (_, __) =>
                      charts.MaterialPalette.blue.shadeDefault,
                      domainFn: (Weather weather, _) => weather.dt,
                      measureFn: (Weather weather, _) => weather.pressure,
                      data: weathers,
                    )
                  ],
                  animate: animate,
                  animationDuration: Duration(milliseconds: 500),
                  primaryMeasureAxis: new charts.NumericAxisSpec(
                      tickProviderSpec: new charts.BasicNumericTickProviderSpec(
                          zeroBound: false
                      )
                  ),
                  behaviors: [
                    new charts.RangeAnnotation([
                      new charts.LineAnnotationSegment(
                        1013.25, charts.RangeAnnotationAxisType.measure,
                        startLabel: 'Sea Lv.')
                    ]),
                  ],
              )
          ),
        )
      ],
    );
  }
}