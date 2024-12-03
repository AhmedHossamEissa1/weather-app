import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:weather_app_advanced/Cubits/get_wather_cubit/get_weather_states.dart';
import 'package:weather_app_advanced/Models/WeatherModel.dart';
import 'package:weather_app_advanced/services/WeatherService.dart';

class WeatherCubit extends Cubit<WeatherStates> {
  WeatherCubit(this.weatherservice) : super(InitialState());
  Weatherservice weatherservice;

  WeatherModel? weatherModel;
  getWeatherCubit({required city}) async {
    emit(LoadingState());
    try {
      weatherModel =
          await Weatherservice(dio: Dio()).getWeatherData(city: city);

      emit(SuccessWeather());
    } catch (e) {
      emit(FailWeather());
    }
  }
}
