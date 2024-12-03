import 'package:flutter/material.dart';

class Nodata extends StatelessWidget {
  const Nodata({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            "There is no weather 😞",
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: Text(
            "Start searching a city now 🔍",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
