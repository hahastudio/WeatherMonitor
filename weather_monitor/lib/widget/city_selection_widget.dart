import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/model/models.dart';
import 'package:weather_monitor/util/constants.dart';

class CitySelectionWidget extends StatefulWidget {
  @override
  State<CitySelectionWidget> createState() => _CitySelectionWidgetState();
}

class _CitySelectionWidgetState extends State<CitySelectionWidget> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController _textController = TextEditingController();
  City city;

  Future saveCity(City _city) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString(Constants.CitySettingKey, _city.name);
    await prefs.setDouble(Constants.LongitudeSettingKey, _city.coordinate.longitude);
    await prefs.setDouble(Constants.LatitudeSettingKey, _city.coordinate.latitude);
    await prefs.setString(Constants.WeatherSettingKey, '');
  }

  @override
  void initState() {
    super.initState();
  }

  static String _displayStringForOption(City option) => option.name;

  @override
  Widget build(BuildContext context) {
    var autoCompleteInput = Autocomplete<City>(
      displayStringForOption: _displayStringForOption,
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text == '') {
          return const Iterable<City>.empty();
        }
        if ((CityViewModel.cities == null) || (CityViewModel.cities.length == 0)) {
          String jsonString = await rootBundle.loadString('assets/current.city.list.min.json');
          var cities = await compute(CityViewModel.loadCities, jsonString);
          CityViewModel.cities = cities;
        }
        return CityViewModel.cities.where((City option) {
          return option.name.toLowerCase()
              .contains(textEditingValue.text.toLowerCase());
        });
      },
      optionsViewBuilder: (BuildContext context, AutocompleteOnSelected<City> onSelected, Iterable<City> options) {
        var optionList = options.toList();
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4.0,
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ListView.separated(
              padding: EdgeInsets.only(right: 10.0),
              itemCount: options.length,
              itemBuilder: (context, int position) {
                var option = optionList[position];
                return GestureDetector(
                  onTap: () {
                    onSelected(option);
                  },
                  child: ListTile(
                    title: Text(_displayStringForOption(option)),
                    subtitle: Text(option.country),
                  ),
                );
              },
              separatorBuilder: (context, _) => const Divider(),
            ),
          ),
        );
      },
      onSelected: (City selection) async {
        city = selection;
        setState(() => _textController.text = selection.name);
        await saveCity(city);
        Navigator.pop(context, _textController.text);
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('City'),
      ),
      body: Form(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5.0, right: 10.0),
                  child: TextButton.icon(
                    onPressed: () async {
                      var city = City(
                          name: Constants.GpsPrefix,
                          coordinate: Location(
                              latitude: 0,
                              longitude: 0
                          )
                      );
                      await saveCity(city);
                      Navigator.pop(context, city.name);
                    },
                    icon: Icon(Icons.gps_fixed, size: 18),
                    label: Text("Use current location",
                      style: TextStyle(
                        fontSize: 18,
                      )
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10.0, right: 10.0),
                    child: autoCompleteInput,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
