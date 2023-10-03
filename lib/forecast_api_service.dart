import 'package:http/http.dart' as http;
import 'package:weather_app/forecast_api_model.dart';

class ForecastService {
  static const String apikey = 'YtORdXEwxTQT23AoYs3PooYkL3hyCuRJ';
  static const List<double> location = [42.3478, -71.0466];
  static const String units = 'metric';
  static const String timeSteps = '1h';

  static Future<ForecastApi> getWeatherForecast() async {
    final uri = Uri(
      scheme: 'https',
      host: 'api.tomorrow.io',
      path: '/v4/weather/forecast',
      queryParameters: {
        'location': location.join(','),
        'timesteps': timeSteps,
        'units': units,
        'apikey': apikey
      },
    );

    final res = await http.get(uri);
    if (res.statusCode == 200) {
      return forecastApiFromJson(res.body);
    } else {
      throw Exception('Failed to fetch forecast data');
    }
  }
}
