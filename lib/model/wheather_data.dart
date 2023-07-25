import 'package:weatherapp_starter_project/model/current_model.dart';
import 'package:weatherapp_starter_project/model/hourly_model.dart';

class WheatherData {
  final WheatherDataCurrent? current;
  final WheatherDataHourly? hourly;
  WheatherData([this.current, this.hourly]);

  WheatherDataCurrent getCurrentWheather() => current!;
  WheatherDataHourly getHourlyWeather() => hourly!;
}
