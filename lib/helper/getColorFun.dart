import 'package:flutter/material.dart';

MaterialColor getColor(String? status) {
  if (status == null) {
    return Colors.blue; // Default color when no weather is available
  } else if (status == "Sunny") {
    return Colors.orange; // Sunny weather color
  } else if (status == "Partly cloudy") {
    return Colors.blueGrey; // Partly cloudy weather color
  } else if (status == "Blizzard" ||
      status == "Freezing fog" ||
      status.contains("shower") ||
      status.contains("freezing") ||
      status == "Light drizzle" ||
      status.contains("drizzle") ||
      status.contains("thunder") ||
      status.contains("sleet") ||
      status == "Cloudy" ||
      status == "Overcast" ||
      status == "Fog" ||
      status == "Mist" ||
      status.contains("rain") ||
      status.contains("snow")) {
    // Use the icy blue snowy color for these conditions
    return const MaterialColor(0xFFE0F7FA, {
      50: Color.fromRGBO(224, 247, 250, .1),
      100: Color.fromRGBO(224, 247, 250, .2),
      200: Color.fromRGBO(224, 247, 250, .3),
      300: Color.fromRGBO(224, 247, 250, .4),
      400: Color.fromRGBO(224, 247, 250, .5),
      500: Color.fromRGBO(224, 247, 250, .6), // Main snowy color
      600: Color.fromRGBO(224, 247, 250, .7),
      700: Color.fromRGBO(224, 247, 250, .8),
      800: Color.fromRGBO(224, 247, 250, .9),
      900: Color.fromRGBO(224, 247, 250, 1),
    });
  } else {
    return Colors.blue; // Default fallback color
  }
}
