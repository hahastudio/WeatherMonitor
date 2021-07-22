import 'dart:io';
import 'package:flutter/material.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WindMapWidget extends StatefulWidget {
  final Location location;

  WindMapWidget(this.location);

  @override
  WindMapState createState() => WindMapState();
}

class WindMapState extends State<WindMapWidget> {
  @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
            "Wind Map",
        ),
        Container(
          padding: EdgeInsets.all(15),
          height: 300,
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            initialUrl: 'https://earth.nullschool.net/#current/wind/surface/level/orthographic=${widget.location.longitude.toStringAsFixed(3)},${widget.location.latitude.toStringAsFixed(3)},1000',
          ),
        ),
      ],
    );
  }
}