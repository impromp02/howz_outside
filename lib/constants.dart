import 'package:flutter/material.dart';

const WEATHER_CODES = {
  0: "Unknown",
  1000: "Clear, Sunny",
  1100: "Mostly Clear",
  1101: "Partly Cloudy",
  1102: "Mostly Cloudy",
  1001: "Cloudy",
  2000: "Fog",
  2100: "Light Fog",
  4000: "Drizzle",
  4001: "Rain",
  4200: "Light Rain",
  4201: "Heavy Rain",
  5000: "Snow",
  5001: "Flurries",
  5100: "Light Snow",
  5101: "Heavy Snow",
  6000: "Freezing Drizzle",
  6001: "Freezing Rain",
  6200: "Light Freezing Rain",
  6201: "Heavy Freezing Rain",
  7000: "Ice Pellets",
  7101: "Heavy Ice Pellets",
  7102: "Light Ice Pellets",
  8000: "Thunderstorm"
};

IconData getIconByWeatherCode(double? weatherCode) {
  return switch (weatherCode) {
    1000 || 1100 => Icons.sunny,
    1101 || 1102 || 1001 || 1103 => Icons.cloud_sync_rounded,
    2100 || 2000 => Icons.foggy,
    4000 || 4200 || 4001 || 4201 => Icons.cloudy_snowing,
    _ => Icons.cancel
  };
}

const weatherConditions = {
  "cloudCover": Icons.cloud,
  "dewPoint": Icons.dew_point,
  "humidity": Icons.umbrella,
  "precipitationProbability": Icons.cloudy_snowing,
  "rainIntensity": Icons.cloudy_snowing,
  "snowIntensity": Icons.cloudy_snowing,
  "uvIndex": Icons.waves,
  "visibility": Icons.remove_red_eye_rounded,
  "windDirection": Icons.double_arrow_sharp,
  "windSpeed": Icons.wind_power
};
