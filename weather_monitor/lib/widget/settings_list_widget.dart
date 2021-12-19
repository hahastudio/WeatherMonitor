import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';
import 'package:weather_monitor/bloc/blocs.dart';
import 'package:weather_monitor/model/theme.dart';

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
            DropDownSettingsTile<int>(
                title: 'Dark Mode',
                settingKey: 'settings.themeMode',
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
          ]
      )
    );
  }
}