import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/model/hourly_model.dart';
import 'package:weatherapp_starter_project/presentation/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/presentation/utils/utils.dart';

class HourlyDataWidget extends StatelessWidget {
  const HourlyDataWidget({super.key, required this.wheatherDataHourly});
  final WheatherDataHourly wheatherDataHourly;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          decoration: BoxDecoration(
            color: CustomColor.firstGradientColor.withOpacity(0.15),
            borderRadius: const BorderRadius.all(
              Radius.circular(8),
            ),
          ),
          child: Text(
            "TODAY",
            style: customTextStyle(
              color: CustomColor.kBlackColor,
              size: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        hourlyListWidget(context),
      ],
    );
  }

  Widget hourlyListWidget(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    RxInt cardIndex = GlobalController().getIndex();
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 20),
      height: screenHeight * 0.21,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: wheatherDataHourly.hourlyModel.length > 12 ? 12 : wheatherDataHourly.hourlyModel.length,
        itemBuilder: ((context, index) {
          return Obx(
            () => GestureDetector(
              onTap: () {
                cardIndex.value = index;
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0.5, 0),
                      blurRadius: 30,
                      spreadRadius: 1,
                      color: CustomColor.dividerLine.withAlpha(150),
                    ),
                  ],
                  gradient: cardIndex.value == index
                      ? const LinearGradient(
                          colors: [
                            CustomColor.firstGradientColor,
                            CustomColor.secondGradientColor,
                          ],
                        )
                      : null,
                ),
                child: HourlyDetails(
                  temp: wheatherDataHourly.hourlyModel[index].temp!.floor(),
                  timeStamp: wheatherDataHourly.hourlyModel[index].dt!.floor(),
                  weatherIcon: wheatherDataHourly.hourlyModel[index].weather![0].icon!,
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}

class HourlyDetails extends StatelessWidget {
  const HourlyDetails({super.key, required this.temp, required this.timeStamp, required this.weatherIcon});
  final int temp;
  final int timeStamp;
  final String weatherIcon;

  String getTime(final timeStamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp * 1250);
    String x = DateFormat.jm().format(dateTime);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidtht = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenWidtht * 0.3,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            getTime(
              timeStamp,
            ),
          ),
          Image.asset(
            "assets/weather/$weatherIcon.png",
            height: 80,
            width: 80,
          ),
          Text(
            '$temp°',
            style: customTextStyle(
              color: CustomColor.kBlackColor,
              size: 14,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
