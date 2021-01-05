import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_monitor/model/models.dart';

class CitySelectionWidget extends StatefulWidget {
  @override
  State<CitySelectionWidget> createState() => _CitySelectionWidgetState();
}

class _CitySelectionWidgetState extends State<CitySelectionWidget> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController _textController = TextEditingController();
  GlobalKey<AutoCompleteTextFieldState<City>> key = new GlobalKey();
  AutoCompleteTextField searchTextField;
  City city;

  void _loadCities() async {
    await CityViewModel.loadCities();
  }

  Future saveCity(City _city) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('city', _city.name);
    await prefs.setDouble('city.coordinate.longitude', _city.coordinate.longitude);
    await prefs.setDouble('city.coordinate.latitude', _city.coordinate.latitude);
  }

  @override
  void initState() {
    _loadCities();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    searchTextField = AutoCompleteTextField<City>(
      style: new TextStyle(color: Colors.black, fontSize: 16.0),
      decoration: new InputDecoration(
        suffixIcon: Container(
          width: 85.0,
          height: 60.0,
        ),
        contentPadding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
        hintText: 'Search city name',
        hintStyle: TextStyle(color: Colors.black)
      ),
      controller: _textController,
      clearOnSubmit: false,
      key: key,
      suggestions: CityViewModel.cities,
      itemSubmitted: (item) {
        city = item;
        setState(
          () => _textController.text = item.name
        );
      },
      itemBuilder: (context, item) {
        return Container(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                item.name,
                style: TextStyle(
                    fontSize: 16.0
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
              ),
              Text(item.country)
            ],
          ),
        );
      },
      itemSorter: (a, b) {
        return a.name.compareTo(b.name);
      },
      itemFilter: (item, query) {
        return item.name
          .toLowerCase()
          .startsWith(query.toLowerCase());
      }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('City'),
      ),
      body: Form(
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: searchTextField,
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () async {
                //FIXME: user may not select a city in the list
                await saveCity(city);
                Navigator.pop(context, _textController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
