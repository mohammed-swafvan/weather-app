import 'package:flutter/widgets.dart';
import 'package:weatherapp_starter_project/model/current_model.dart';
import 'package:weatherapp_starter_project/presentation/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/presentation/utils/global_variables.dart';
import 'package:weatherapp_starter_project/presentation/utils/utils.dart';
import 'package:weatherapp_starter_project/presentation/widgets/current_details_icon_widget.dart';

class CurrentWheatherWidget extends StatelessWidget {
  const CurrentWheatherWidget({super.key, required this.wheatherDataCurrent});
  final WheatherDataCurrent wheatherDataCurrent;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        temperatureAreaWidget(),
        kHeight15,
        currentWeatherMoreDetailsWidget(),
      ],
    );
  }

  Widget temperatureAreaWidget() {
    return Container(
      margin: const EdgeInsets.only(left: 14, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            "assets/weather/${wheatherDataCurrent.currentModel.weather![0].icon}.png",
            width: 80,
            height: 80,
          ),
          Container(
            height: 50,
            width: 1,
            color: CustomColor.dividerLine,
          ),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "${wheatherDataCurrent.currentModel.temp!.floor()}°",
                  style: customTextStyle(
                    color: CustomColor.kBlackColor,
                    size: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text: "${wheatherDataCurrent.currentModel.weather![0].description}°",
                  style: customTextStyle(
                    color: CustomColor.kBlueGrey,
                    size: 10,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget currentWeatherMoreDetailsWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CurrentDeatailIconWidget(icon: "assets/icons/windspeed.png"),
            CurrentDeatailIconWidget(icon: "assets/icons/clouds.png"),
            CurrentDeatailIconWidget(icon: "assets/icons/humidity.png"),
          ],
        ),
        kHeight5,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "${wheatherDataCurrent.currentModel.windSpeed!.floor()} km/h",
              style: customTextStyle(
                color: CustomColor.kBlackColor,
                size: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "${wheatherDataCurrent.currentModel.clouds}%",
              style: customTextStyle(
                color: CustomColor.kBlackColor,
                size: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
            Text(
              "${wheatherDataCurrent.currentModel.humidity}%",
              style: customTextStyle(
                color: CustomColor.kBlackColor,
                size: 10,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
