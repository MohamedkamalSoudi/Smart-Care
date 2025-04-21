import 'package:flutter/material.dart';
import 'package:smart_care_app/core/app_colors.dart';

class CardContent extends StatelessWidget {
  const CardContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: Text(
              'C-Virase',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.black),
            ),
          ),
          SizedBox(height: 25),
          Row(
            children: [
              Text(
                'Scheduled for',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.grey100,
                ),
              ),
              Text(
                ' April 19 ,2025',
                style: TextStyle(
                  fontSize: 12,
                  color: AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
