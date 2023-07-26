import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:get/get.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weatherapp_starter_project/presentation/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/presentation/utils/utils.dart';
import 'package:intl/intl.dart';

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String city = '';
  DateTime dateTime = DateTime.now();
  final GlobalController globalController = Get.put(
    GlobalController(),
    permanent: true,
  );

  @override
  void initState() {
    getAddress(
      globalController.getLatitude().value,
      globalController.getLongitude().value,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            city,
            style: customTextStyle(
              color: CustomColor.kBlackColor,
              size: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            DateFormat.yMMMd().format(
              dateTime,
            ),
            style: customTextStyle(
              color: CustomColor.kGreyColor,
              size: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  getAddress(double latitude, double longitude) async {
    List<Placemark> placemark = await placemarkFromCoordinates(latitude, longitude);
    Placemark place = placemark[0];
    setState(
      () {
        city = place.locality!;
      },
    );
  }
}
