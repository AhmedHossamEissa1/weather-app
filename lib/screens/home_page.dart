import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_advanced/Cubits/get_wather_cubit/get_weather_cubit.dart';
import 'package:weather_app_advanced/Cubits/get_wather_cubit/get_weather_states.dart';
import 'package:weather_app_advanced/screens/NoData.dart';
import 'package:weather_app_advanced/screens/WithData.dart';
import 'package:weather_app_advanced/screens/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // var weatherclass = BlocProvider.of<WeatherCubit>(context).weatherVar;

    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }));
              },
              icon: const Icon(
                Icons.search,
                // color: Colors.white,
              ),
            )
          ],
          // backgroundColor: Colors.blue,
          title: const Text(
            "Weather App",
          ),
        ),
        body: BlocBuilder<WeatherCubit, WeatherStates>(
          builder: (context, state) {
            if (state is LoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessWeather) {
              return Withdata();
            } else if (state is FailWeather) {
              return const Center(child: Text("Oops, there is an error"));
            } else {
              return const Nodata();
            }
          },
        ));
  }
}
