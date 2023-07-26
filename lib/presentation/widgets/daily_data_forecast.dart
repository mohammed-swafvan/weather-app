import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherapp_starter_project/model/daily_model.dart';
import 'package:weatherapp_starter_project/presentation/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/presentation/utils/global_variables.dart';
import 'package:weatherapp_starter_project/presentation/utils/utils.dart';

class DailyDataForeCastWidget extends StatelessWidget {
  const DailyDataForeCastWidget({super.key, required this.wheatherDataDaily});

  final WheatherDataDaily wheatherDataDaily;

  String getDay(final day) {
    DateTime date = DateTime.fromMillisecondsSinceEpoch(day * 1000);
    String x = DateFormat('EEE').format(date);
    return x;
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      padding: const EdgeInsets.all(10),
      height: screenHeight * 0.45,
      decoration: BoxDecoration(
        color: CustomColor.dividerLine.withAlpha(200),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              'Next Days',
              style: customTextStyle(
                color: CustomColor.kBlackColor,
                size: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          dailyListWidget(screenHeight),
        ],
      ),
    );
  }

  Widget dailyListWidget(screenHeight) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
      height: screenHeight * 0.4,
      child: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: wheatherDataDaily.daily.length > 7 ? 7 : wheatherDataDaily.daily.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  getDay(wheatherDataDaily.daily[index].dt),
                  style: customTextStyle(
                    color: CustomColor.kBlackColor,
                    size: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                GlobalVariables.kWidth5,
                Image.asset(
                  "assets/weather/${wheatherDataDaily.daily[index].weather![0].icon}.png",
                  height: 35,
                  width: 35,
                ),
                Text(
                  '${wheatherDataDaily.daily[index].temp!.max}°/${wheatherDataDaily.daily[index].temp!.min}',
                  style: customTextStyle(
                    color: CustomColor.kBlackColor,
                    size: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) => const Divider(thickness: 0.6),
      ),
    );
  }
}
