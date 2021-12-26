import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:weather_monitor/bloc/blocs.dart';
import 'package:weather_monitor/model/theme.dart';
import 'package:weather_monitor/util/constants.dart';

class SettingsListWidget extends StatefulWidget {
  @override
  _SettingsListWidgetState createState() => _SettingsListWidgetState();
}

class _SettingsListWidgetState extends State<SettingsListWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SettingsScreen(
          title: 'Settings',
          children: [
            SettingsGroup(
              title: 'Appearances',
              children: [
                DropDownSettingsTile<int>(
                  title: 'Dark Mode',
                  settingKey: Constants.ThemeSettingKey,
                  selected: 0,
                  values: <int, String>{
                    0: 'System',
                    1: 'Light',
                    2: 'Dark',
                  },
                  onChange: (value) {
                    if (value < 0)
                      value = 0;
                    if (value > 2)
                      value = 2;
                    BlocProvider.of<ThemeBloc>(context).add(
                      ThemeEvent(appTheme: AppTheme.values[value]),
                    );
                  },
                )
              ],
            ),
            SettingsGroup(
              title: 'Data Source',
              children: [
                TextInputSettingsTile(
                  title: 'OpenWeather API',
                  settingKey: Constants.OpenWeatherApiSettingKey,
                  initialValue: '',
                  validator: (String username) {
                    if (username != null && username.length > 0) {
                      return null;
                    }
                    return "OpenWeather API key cannot be empty.";
                  },
                  borderColor: Colors.blueAccent,
                  errorColor: Colors.deepOrangeAccent,
                ),
                TextInputSettingsTile(
                  title: 'ColorfulClouds API',
                  settingKey: Constants.ColorfulCloudsApiSettingKey,
                  initialValue: '',
                  validator: (String username) {
                    return null;
                  },
                  borderColor: Colors.blueAccent,
                  errorColor: Colors.deepOrangeAccent,
                )
              ],
            )
          ]
      )
    );
  }
}