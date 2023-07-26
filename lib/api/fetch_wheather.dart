import 'dart:convert';
import 'dart:developer';

import 'package:weatherapp_starter_project/model/current_model.dart';
import 'package:weatherapp_starter_project/model/daily_model.dart';
import 'package:weatherapp_starter_project/model/hourly_model.dart';
import 'package:weatherapp_starter_project/model/wheather_data.dart';
import 'package:http/http.dart' as http;
import 'package:weatherapp_starter_project/presentation/utils/api_url.dart';

class FetchWheatherApi {
  WheatherData? wheatherData;

  Future proccessData(lat, lon) async {
    try {
      var response = await http.get(Uri.parse(apiUrl(lat, lon)));
      var jsonBody = jsonDecode(response.body);
      wheatherData = WheatherData(
        WheatherDataCurrent.fromJson(jsonBody),
        WheatherDataHourly.fromJson(jsonBody),
        WheatherDataDaily.fromJson(jsonBody),
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return wheatherData!;
      } else {
        log('Server Failure');
      }
    } catch (e) {
      log('Client Failure');
    }
  }
}
