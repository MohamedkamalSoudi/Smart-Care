import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

class CardContent extends StatelessWidget {
  final String testName;
  final String formattedDate;

  const CardContent({
    super.key,
    required this.testName,
    required this.formattedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 14),
          child: Text(
            testName,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
        ),
        const SizedBox(height: 25),
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
              ' $formattedDate',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
