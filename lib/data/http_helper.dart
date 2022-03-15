import 'package:http/http.dart';

class HttpHelper {
  //https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=29c7503bd044159c3eab22f39848ede8
  final String authority = 'api.openweathermap.org';
  final String path = 'data/2.5/weather';
  final String apiKey = '29c7503bd044159c3eab22f39848ede8';

  Future<String> getWeather
}
