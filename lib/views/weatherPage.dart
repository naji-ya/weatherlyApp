import 'package:flutter/material.dart';
import 'package:weatherly_app/model/model.dart';
import 'package:weatherly_app/services/weatherServices.dart';

class Weatherpage extends StatefulWidget {
  const Weatherpage({super.key});

  @override
  State<Weatherpage> createState() => _WeatherpageState();
}

class _WeatherpageState extends State<Weatherpage> {
  // api key
  final weatherService = WeatherService("c67b253300c8697393239000c774944d");
  Weather? weather;

  fetchWeather() async {
    // get the current city
    String cityName = await weatherService.getCurrentCity();

    // get weather for city
try {
  final _weather = await weatherService.getWeather(cityName);
  setState(() {
    weather = _weather;
  });
}
catch (e){
  print(e);
}
  }

// weather animation

  //init state
  @override
  void initState() {
    // fetch weather on start up
    fetchWeather();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Column(mainAxisAlignment: MainAxisAlignment.center,
  children: [
    // cityname
Text(weather?.cityName ?? "Loading city"),
    //temperature
    Text('${weather?.temperature.round()}\u2103'),

  ],
),
    );
  }
}
