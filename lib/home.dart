import 'package:flutter/material.dart';
import 'package:weather_app/constants.dart';
import 'package:weather_app/forecast_api_model.dart';
import 'package:weather_app/forecast_api_service.dart';
import 'package:weather_app/forecast_item.dart';
import 'package:weather_app/home_hero.dart';
import 'package:weather_app/info_item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<ForecastApi> futureForecast;

  @override
  void initState() {
    super.initState();
    futureForecast = ForecastService.getWeatherForecast();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Howz Outside'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: FutureBuilder(
        future: futureForecast,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator.adaptive();
          }

          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }

          final tod = TimeOfDay.now();
          final currentCondition = snapshot.data!.timelines.hourly
              .firstWhere((element) => tod.hour == element.time.hour);
          final futureConditions = snapshot.data!.timelines.hourly
              .where((element) => element.time.hour > tod.hour);

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: HomeHero(
                    currentTemp: '${currentCondition.values['temperature']}°C',
                    icon: getIconByWeatherCode(
                        currentCondition.values['weatherCode']),
                    weatherCondition:
                        WEATHER_CODES[currentCondition.values['weatherCode']]!,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Hourly Forecast',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: futureConditions
                        .map(
                          (e) => ForecastItem(
                            icon: getIconByWeatherCode(e.values['weatherCode']),
                            hour: e.time.hour.toStringAsFixed(2),
                            temp: '${e.values['temperature']}°C',
                          ),
                        )
                        .toList(),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Additional Information',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InformationItem(
                      icon: weatherConditions['humidity']!,
                      label: 'Humidity',
                      value: currentCondition.values['humidity']!,
                    ),
                    InformationItem(
                      icon: weatherConditions['uvIndex']!,
                      label: 'UV',
                      value: currentCondition.values['uvIndex']!,
                    ),
                    InformationItem(
                      icon: weatherConditions['windSpeed']!,
                      label: 'Wind Speed',
                      value: currentCondition.values['windSpeed']!,
                    ),
                    InformationItem(
                      icon: weatherConditions['windDirection']!,
                      label: 'Wind Direction',
                      value: currentCondition.values['windDirection']!,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
