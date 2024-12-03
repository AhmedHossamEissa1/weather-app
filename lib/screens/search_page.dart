import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_advanced/Cubits/get_wather_cubit/get_weather_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    String city = ''; // To store the input from the TextField

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Search a city"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            onChanged: (value) {
              city = value; // Update the city variable as user types
            },
            decoration: InputDecoration(
              suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  if (city.isNotEmpty) {
                    // Trigger the WeatherCubit function
                    var weatherCubit = BlocProvider.of<WeatherCubit>(context);
                    weatherCubit.getWeatherCubit(city: city);
                    Navigator.pop(context); // Go back to the previous screen
                  } else {
                    // Show a warning if no city is entered
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a city name'),
                      ),
                    );
                  }
                },
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 25,
                horizontal: 20,
              ),
              labelText: 'Search',
              hintText: 'Enter city name',
            ),
          ),
        ),
      ),
    );
  }
}
