import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_advanced/Cubits/get_wather_cubit/get_weather_cubit.dart';
import 'package:weather_app_advanced/helper/getColorFun.dart';


class Withdata extends StatelessWidget {
  Withdata({super.key});

  @override
  Widget build(BuildContext context) {
    var weatherVar = BlocProvider.of<WeatherCubit>(context).weatherModel;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              getColor(weatherVar!.status)[500]!,
              getColor(weatherVar.status)[200]!,
              getColor(weatherVar.status)[50]!
            ])),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    weatherVar.city, // Use the non-nullable `weatherclass`
                    style:const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Text(
                      "Updated at ${weatherVar.time.hour}:${weatherVar.time.minute}",
                      style:
                        const  TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    width: 100,
                    height: 100,
                    "https:${weatherVar.icon}",
                  ),
                  Text(
                    "${weatherVar.avgTemp.round()}",
                    style:const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  Column(
                    children: [
                      Text("Max Temp: ${weatherVar.maxTemp.round()}",
                          style:const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Text("Min Temp: ${weatherVar.minTemp.round()}",
                          style:const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
              Text(weatherVar.status,
                  style:const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
