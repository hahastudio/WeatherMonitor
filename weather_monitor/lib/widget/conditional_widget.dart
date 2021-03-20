import 'package:flutter/material.dart';
import 'package:weather_monitor/widget/widgets.dart';

/// A fake conditional widget
/// It will
class ConditionalWidget extends StatelessWidget {
  final bool condition;
  final Widget Function(BuildContext context) widgetBuilder;

  ConditionalWidget({
    @required this.condition,
    @required this.widgetBuilder
  });

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return widgetBuilder(context);
    } else {
      return EmptyWidget();
    }
  }
}