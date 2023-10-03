import 'dart:convert';

ForecastApi forecastApiFromJson(String str) =>
    ForecastApi.fromJson(json.decode(str));

String forecastApiToJson(ForecastApi data) => json.encode(data.toJson());

class ForecastApi {
  Timelines timelines;
  Location location;

  ForecastApi({
    required this.timelines,
    required this.location,
  });

  factory ForecastApi.fromJson(Map<String, dynamic> json) => ForecastApi(
        timelines: Timelines.fromJson(json["timelines"]),
        location: Location.fromJson(json["location"]),
      );

  Map<String, dynamic> toJson() => {
        "timelines": timelines.toJson(),
        "location": location.toJson(),
      };
}

class Location {
  double lat;
  double lon;

  Location({
    required this.lat,
    required this.lon,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        lat: json["lat"]?.toDouble(),
        lon: json["lon"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lon": lon,
      };
}

class Timelines {
  List<Hourly> hourly;

  Timelines({
    required this.hourly,
  });

  factory Timelines.fromJson(Map<String, dynamic> json) => Timelines(
        hourly:
            List<Hourly>.from(json["hourly"].map((x) => Hourly.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "hourly": List<dynamic>.from(hourly.map((x) => x.toJson())),
      };
}

class Hourly {
  DateTime time;
  Map<String, double?> values;

  Hourly({
    required this.time,
    required this.values,
  });

  factory Hourly.fromJson(Map<String, dynamic> json) => Hourly(
        time: DateTime.parse(json["time"]),
        values: Map.from(json["values"])
            .map((k, v) => MapEntry<String, double?>(k, v?.toDouble())),
      );

  Map<String, dynamic> toJson() => {
        "time": time.toIso8601String(),
        "values":
            Map.from(values).map((k, v) => MapEntry<String, dynamic>(k, v)),
      };
}
