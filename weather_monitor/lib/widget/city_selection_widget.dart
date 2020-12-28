import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CitySelectionWidget extends StatefulWidget {
  @override
  State<CitySelectionWidget> createState() => _CitySelectionWidgetState();
}

class _CitySelectionWidgetState extends State<CitySelectionWidget> {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController _textController = TextEditingController();

  void saveCity(String _city) async {
    final SharedPreferences prefs = await _prefs;
    await prefs.setString('city', _city);
  }

  @override
  Widget build(BuildContext context) {
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
                child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(
                    labelText: 'City',
                    hintText: 'Chicago',
                  ),
                ),
              ),
            ),
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                saveCity(_textController.text);
                Navigator.pop(context, _textController.text);
              },
            )
          ],
        ),
      ),
    );
  }
}
