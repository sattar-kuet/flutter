import 'package:global_fitness/data/weather.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../data/weather.dart';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=29c7503bd044159c3eab22f39848ede8
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '29c7503bd044159c3eab22f39848ede8';

  Future<Weather> getWeather(String cityName) async {
    Map<String, dynamic> parameters = {'q': cityName, 'appid': apiKey};
    Uri uri = Uri.https(authority, path, parameters);
    http.Response result = await http.get(uri);
    Map<String, dynamic> data = json.decode(result.body);
    Weather weather = Weather.fromJson(data);
    return weather;
  }
}
