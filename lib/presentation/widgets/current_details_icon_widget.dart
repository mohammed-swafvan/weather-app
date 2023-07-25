import 'package:flutter/material.dart';
import 'package:weatherapp_starter_project/presentation/utils/custom_colors.dart';

// ignore: must_be_immutable
class CurrentDeatailIconWidget extends StatelessWidget {
  CurrentDeatailIconWidget({super.key, required this.icon});
  String icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      width: 70,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: CustomColor.cardColor,
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Image.asset(icon),
    );
  }
}
