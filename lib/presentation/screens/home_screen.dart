import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weatherapp_starter_project/controller/global_controller.dart';
import 'package:weatherapp_starter_project/presentation/utils/custom_colors.dart';
import 'package:weatherapp_starter_project/presentation/utils/global_variables.dart';
import 'package:weatherapp_starter_project/presentation/widgets/comfort_level_widget.dart';
import 'package:weatherapp_starter_project/presentation/widgets/current_wheather_widget.dart';
import 'package:weatherapp_starter_project/presentation/widgets/daily_data_forecast.dart';
import 'package:weatherapp_starter_project/presentation/widgets/header_widget.dart';
import 'package:weatherapp_starter_project/presentation/widgets/hourly_data_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalController globalController = Get.put(
      GlobalController(),
      permanent: true,
    );
    return RefreshIndicator(
      onRefresh: () async {
        globalController.isLoading.value = true;
        globalController.onInit();
      },
      child: Scaffold(
        body: SafeArea(
          child: Obx(
            () => globalController.checkLoading().isTrue
                ? Center(
                    child: Image.asset('assets/icons/clouds.png'),
                  )
                : ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      GlobalVariables.kHeight10,
                      const HeaderWidget(),
                      GlobalVariables.kHeight15,
                      CurrentWheatherWidget(
                        wheatherDataCurrent: globalController.getData().getCurrentWeather(),
                      ),
                      GlobalVariables.kHeight25,
                      HourlyDataWidget(
                        wheatherDataHourly: globalController.getData().getHourlyWeather(),
                      ),
                      DailyDataForeCastWidget(
                        wheatherDataDaily: globalController.getData().getDailyWeather(),
                      ),
                      const Divider(
                        thickness: 1,
                        color: CustomColor.dividerLine,
                      ),
                      ComfortLevelWidget(
                        wheatherDataCurrent: globalController.getData().getCurrentWeather(),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
