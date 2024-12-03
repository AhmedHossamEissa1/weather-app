import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_advanced/Cubits/get_wather_cubit/get_weather_cubit.dart';
import 'package:weather_app_advanced/Cubits/get_wather_cubit/get_weather_states.dart';
import 'package:weather_app_advanced/helper/getColorFun.dart';
import 'package:weather_app_advanced/screens/home_page.dart';
import 'package:weather_app_advanced/services/WeatherService.dart';
import 'package:weather_app_advanced/widgets/custom_themData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherCubit(Weatherservice(dio: Dio())),
      child: BlocBuilder<WeatherCubit, WeatherStates>(
        builder: (context, state) {
          var weatherModel = context.read<WeatherCubit>().weatherModel;

          return MaterialApp(
            theme: ThemeManager.getTheme(weatherModel),
            debugShowCheckedModeBanner: false,
            home: const SplashScreen(), // Use SplashScreen here
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Simulate a loading delay
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });

    return Scaffold(
      backgroundColor: const Color(0xFF42a5f5), // Same color as in splash config
      body: Center(
        child: ClipOval(
          child: Image.asset(
            'assets/images/app10.jpg',
            width: 160,
            height: 160,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
