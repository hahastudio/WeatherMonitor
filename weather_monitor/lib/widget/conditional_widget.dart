import 'package:flutter/material.dart';
import 'package:weather_monitor/widget/widgets.dart';

class ConditionalWidget extends StatelessWidget {
  final bool condition;
  final Widget child;

  ConditionalWidget({
    @required this.condition,
    @required this.child
  });

  @override
  Widget build(BuildContext context) {
    if (condition) {
      return child;
    } else {
      return EmptyWidget();
    }
  }
}