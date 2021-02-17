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
  bool lockInBackground = true;
  bool notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: SettingsScreen(
          title: 'Settings',
          children: [
            SwitchSettingsTile(
              settingKey: 'settings.isDarkMode',
              title: 'Dark Mode',
              enabledLabel: 'Enabled',
              disabledLabel: 'Disabled',
              leading: Icon(Icons.palette),
              onChange: (value) async {
                BlocProvider.of<ThemeBloc>(context).add(
                  ThemeEvent(appTheme: value ? AppTheme.darkTheme : AppTheme.lightTheme),
                );
              },
            )
          ]
      )
    );
  }

  Future saveTheme(bool isDarkMode) async {
    await Settings.setValue<bool>('settings.isDarkMode', isDarkMode);
  }
}