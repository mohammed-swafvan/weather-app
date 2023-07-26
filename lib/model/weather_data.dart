import 'package:weatherapp_starter_project/model/current_model.dart';
import 'package:weatherapp_starter_project/model/daily_model.dart';
import 'package:weatherapp_starter_project/model/hourly_model.dart';

class WeatherData {
  final WeatherDataCurrent? current;
  final WeatherDataHourly? hourly;
  final WeatherDataDaily? daily;
  WeatherData([this.current, this.hourly, this.daily]);

  WeatherDataCurrent getCurrentWeather() => current!;
  WeatherDataHourly getHourlyWeather() => hourly!;
  WeatherDataDaily getDailyWeather() => daily!;
}
