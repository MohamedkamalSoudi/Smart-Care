import 'package:flutter/material.dart';
import 'package:smart_care_app/core/app_colors.dart';

class GreenLine extends StatelessWidget {
  const GreenLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 16, bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: 4,
          height: double.infinity,
          color: AppColors.green,
        ),
      ),
    );
  }
}