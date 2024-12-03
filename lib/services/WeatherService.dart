import 'package:dio/dio.dart';
import 'package:weather_app_advanced/Models/WeatherModel.dart';

class Weatherservice {
  final Dio dio;
  final String baseUrl = "http://api.weatherapi.com/v1/forecast.json";
  final String apikey = "0c04c31e18634c16bcf222239240610";

  Weatherservice({required this.dio});

  Future<WeatherModel> getWeatherData({required city}) async {
    Response response = await dio
        .get('$baseUrl?key=$apikey&q=$city');
    var jsonData = response.data;
    WeatherModel weatherclass = WeatherModel.fromjson(jsonData);
    return weatherclass;
  }
}
