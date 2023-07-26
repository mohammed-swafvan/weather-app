import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:weatherapp_starter_project/model/current_model.dart';
import 'package:weatherapp_starter_project/presentation/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/presentation/utils/global_variables.dart';
import 'package:weatherapp_starter_project/presentation/utils/utils.dart';

class ComfortLevelWidget extends StatelessWidget {
  const ComfortLevelWidget({super.key, required this.wheatherDataCurrent});

  final WeatherDataCurrent wheatherDataCurrent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GlobalVariables.kHeight10,
        Text(
          "Comfort Level",
          style: customTextStyle(
            color: CustomColor.kBlackColor,
            size: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        GlobalVariables.kHeight20,
        SleekCircularSlider(
          initialValue: wheatherDataCurrent.currentModel.humidity!.toDouble(),
          min: 0,
          max: 100,
          appearance: CircularSliderAppearance(
            animationEnabled: true,
            infoProperties: InfoProperties(
              bottomLabelText: 'Humidity',
              bottomLabelStyle: TextStyle(
                color: CustomColor.kBlackColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
                letterSpacing: 0.1,
                height: 1.8,
              ),
            ),
            size: 140,
            customWidths: CustomSliderWidths(
              handlerSize: 0,
              trackWidth: 12,
              progressBarWidth: 13,
            ),
            customColors: CustomSliderColors(
              hideShadow: true,
              trackColor: CustomColor.firstGradientColor.withAlpha(80),
              progressBarColors: [
                CustomColor.firstGradientColor,
                CustomColor.secondGradientColor,
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GlobalVariables.kWidth15,
            Text(
              "Feels Like ${wheatherDataCurrent.currentModel.feelsLike}",
              style: customTextStyle(
                color: CustomColor.kBlackColor,
                size: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              height: 20,
              width: 1,
              color: CustomColor.dividerLine,
            ),
            Text(
              "UV Index ${wheatherDataCurrent.currentModel.uvi}",
              style: customTextStyle(
                color: CustomColor.kBlackColor,
                size: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            GlobalVariables.kWidth15,
          ],
        ),
        GlobalVariables.kHeight25,
      ],
    );
  }
}
