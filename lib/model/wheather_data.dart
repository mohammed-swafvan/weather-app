import 'package:weatherapp_starter_project/model/current_model.dart';
import 'package:weatherapp_starter_project/model/daily_model.dart';
import 'package:weatherapp_starter_project/model/hourly_model.dart';

class WheatherData {
  final WheatherDataCurrent? current;
  final WheatherDataHourly? hourly;
  final WheatherDataDaily? daily;
  WheatherData([this.current, this.hourly, this.daily]);

  WheatherDataCurrent getCurrentWheather() => current!;
  WheatherDataHourly getHourlyWeather() => hourly!;
  WheatherDataDaily getDailyWeather() => daily!;
}
