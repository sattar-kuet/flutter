import 'package:flutter/material.dart';
import '../data/http_helper.dart';
import '../data/weather.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController txtCityName = TextEditingController();
  Weather weather = Weather('', '', 0, 0, 0, 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                controller: txtCityName,
                decoration: InputDecoration(
                    hintText: 'Enter City Name',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: getWeather,
                    )),
              ),
            ),
            weatherRow('Pace', weather.name),
            weatherRow('Temperature', weather.temperature.toStringAsFixed(2)),
          ],
        ),
      ),
    );
  }

  Future getWeather() async {
    HttpHelper helper = HttpHelper();
    weather = await helper.getWeather(txtCityName.text);
    setState(() {});
  }

  Widget weatherRow(String label, String value) {
    Widget row = Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).hintColor,
                ),
              )),
          Expanded(
              flex: 4,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).primaryColor,
                ),
              )),
        ],
      ),
    );
    return row;
  }
}
