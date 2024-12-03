class WeatherModel {
  final String city;
  final DateTime time;
  final String icon;
  final double avgTemp;
  final double maxTemp;
  final double minTemp;
  final String status;

  const WeatherModel(
      {required this.city,
      required this.time,
      required this.icon,
      required this.avgTemp,
      required this.maxTemp,
      required this.minTemp,
      required this.status});

  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        city: json['location']['name'],
        time: DateTime.parse(json['current']['last_updated']),
        icon: json['forecast']['forecastday'][0]['day']['condition']['icon'],
        avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        status: json['forecast']['forecastday'][0]['day']['condition']['text']);
  }
}
