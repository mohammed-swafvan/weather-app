import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/api/fetch_wheather.dart';
import 'package:weatherapp_starter_project/model/weather_data.dart';

class GlobalController extends GetxController {
  // variables
  final RxBool isLoading = true.obs;
  final RxDouble latitude = 0.0.obs;
  final RxDouble longitude = 0.0.obs;
  final RxInt currentIndex = 0.obs;

  RxBool checkLoading() => isLoading;
  RxDouble getLatitude() => latitude;
  RxDouble getLongitude() => longitude;

  final wheatherData = WeatherData().obs;
  WeatherData getData() {
    return wheatherData.value;
  }

  @override
  void onInit() {
    super.onInit();
    if (isLoading.isTrue) {
      getLocation();
    } else {
      getIndex();
    }
  }

  getLocation() async {
    bool isLocationEnabled;
    LocationPermission locationPermission;
    isLocationEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isLocationEnabled) {
      return Future.error("Location service is not enabled");
    }

    locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.deniedForever) {
      return Future.error("Location permission is denied forever");
    } else if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.denied) {
        return Future.error("Location permission is denied");
      }
    }

    return Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).then(
      (value) {
        latitude.value = value.latitude;
        longitude.value = value.longitude;
        //calling wheather api
        return FetchWheatherApi().proccessData(value.latitude, value.longitude).then((value) {
          wheatherData.value = value;
          isLoading.value = false;
        });
      },
    );
  }

  RxInt getIndex() {
    return currentIndex;
  }
}
