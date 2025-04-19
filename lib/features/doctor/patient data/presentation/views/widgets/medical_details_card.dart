import 'package:flutter/material.dart';
import 'package:smart_care_app/core/app_colors.dart';

class MedicalDetailsCard extends StatelessWidget {
  final List<Widget>? content;

  const MedicalDetailsCard({
    super.key,
    this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whitebody,
      elevation: 3,
      margin: const EdgeInsets.only(right: 140 , left: 5),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Medical Details',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.grey60,
              ),
            ),
          ],
        ),
      ),
    );
  }
}