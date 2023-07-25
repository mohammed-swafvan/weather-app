import 'package:weatherapp_starter_project/model/current_model.dart';

class WheatherData {
  final WheatherDataCurrent? current;
  WheatherData([this.current]);

  WheatherDataCurrent getCurrentWheather() => current!;
}
