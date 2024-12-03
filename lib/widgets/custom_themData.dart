import 'package:flutter/material.dart';
import 'package:weather_app_advanced/Models/WeatherModel.dart';
import 'package:weather_app_advanced/helper/getColorFun.dart';


class ThemeManager {
  static ThemeData getTheme(WeatherModel? weatherModel) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: 20,
        color: (weatherModel?.status == null)
            ? Colors.blue
            : getColor(weatherModel!.status),
        titleTextStyle: const TextStyle(
          fontSize: 25,
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: const IconThemeData(color: Colors.black, size: 30),
        actionsIconTheme: const IconThemeData(size: 35),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // Rounded corners
          borderSide: const BorderSide(
            color: Colors.grey, // Border color
            width: 2.0, // Border width
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: (weatherModel?.status == null)
                ? Colors.blue
                : getColor(weatherModel!.status), // Color of border when enabled
            width: 2.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: (weatherModel?.status == null)
                ? Colors.blue
                : getColor(weatherModel!.status), // Color of border when focused
            width: 2.0,
          ),
        ),
        hintStyle: const TextStyle(
          color: Colors.grey, // Hint text color
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        labelStyle: const TextStyle(
          color: Colors.grey, // Label text color
          fontSize: 16, // Label font size
        ),
      ),
    );
  }
}
