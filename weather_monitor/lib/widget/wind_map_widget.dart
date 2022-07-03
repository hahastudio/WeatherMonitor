import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
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
    // Enable virtual display.
    //if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    var url = 'https://earth.nullschool.net/#current/wind/surface/level/orthographic=${widget.location.longitude.toStringAsFixed(3)},${widget.location.latitude.toStringAsFixed(3)},1000';
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextButton.icon(
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 15),
          ),
          onPressed: () async {
            if (await canLaunchUrlString(url)){
              await launchUrlString(url, mode: LaunchMode.externalApplication);
            } else {
              // can't launch url
            }
          },
          icon: Icon(
            CupertinoIcons.arrow_up_left_square,
            size: 15,
          ),
          label: Text('Wind Map'),
        ),
        Container(
          padding: EdgeInsets.all(15),
          height: 300,
          child: WebView(
            javascriptMode: JavascriptMode.unrestricted,
            zoomEnabled: true,
            initialUrl: url,
          ),
        ),
      ],
    );
  }
}