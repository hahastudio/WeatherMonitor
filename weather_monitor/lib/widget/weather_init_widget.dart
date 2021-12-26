import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WeatherInitWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Center(
          child: new RichText(
            textScaleFactor: 1.2,
            text: new TextSpan(
              style: DefaultTextStyle.of(context).style,
              children: [
                new TextSpan(
                    text: '1. ',
                    children: [
                      new TextSpan(
                        text: 'Get OpenWeather API key',
                        style: TextStyle(
                            color: Colors.lightBlue
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () { launch('https://openweathermap.org/api');
                          },
                      ),
                      WidgetSpan(
                        child: Icon(
                            Icons.open_in_browser,
                            color: Colors.lightBlue,
                            size: 18,
                        ),
                      ),
                      new TextSpan(
                        text: '\n',
                      )
                    ]
                ),
                new TextSpan(
                    text: '2. ',
                    children: [
                      new TextSpan(
                        text: '(Optional) Get ColorfulClouds API key',
                        style: TextStyle(
                            color: Colors.lightBlue
                        ),
                        recognizer: new TapGestureRecognizer()
                          ..onTap = () { launch('https://open.caiyunapp.com/ColorfulClouds_Weather_API');
                          },
                      ),
                      WidgetSpan(
                        child: Icon(
                          Icons.open_in_browser,
                          color: Colors.lightBlue,
                          size: 18,
                        ),
                      ),
                      new TextSpan(
                        text: '\n',
                      )
                    ]
                ),
                new TextSpan(
                  text: '3. Configure API keys in settings on top right corner\n',
                ),
                new TextSpan(
                  text: '4. Select a city on bottom right corner',
                ),
              ],
            ),
          )
      ),
    );
  }

}