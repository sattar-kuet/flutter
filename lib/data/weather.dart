class Weather {
  String name = '';
  String description = '';
  double temperature = 0;
  double perceived = 0;
  int pressure = 0;
  int humidity = 0;

  Weather(this.name, this.description, this.temperature, this.perceived,
      this.pressure, this.humidity);

  Weather.fromJson(Map<String, dynamic> weatherMap) {
    this.name = weatherMap['name'];
    this.temperature = weatherMap['main']['temp'];
    this.perceived = weatherMap['main']['feels_like'];
    this.pressure = weatherMap['main']['pressure'];
    this.humidity = weatherMap['main']['humidity'];
    this.description = weatherMap['weather'][0]['description'] ?? '';
  }
}
