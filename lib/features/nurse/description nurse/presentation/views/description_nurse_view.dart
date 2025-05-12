import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/widgets/patient_data_appbar.dart';

class DescriptionNurseView extends StatelessWidget {
  static const id = 'DescriptionNurseView';
  final dateTime = DateTime.now();
  DescriptionNurseView({super.key,});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PatientDataAppbar(
        title: 'Description of the condition',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 200,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          decoration: BoxDecoration(
            color: AppColors.cardDescription,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(color: Colors.white, fontSize: 26),
                  ),
                ],
              ),
                SizedBox(height: 30),
              const Text(
                'Mohamed Kamal Soudi Flutter developer', 
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const Spacer(),
              RichText(
                      textAlign: TextAlign.end,
                      text: TextSpan(
                        children: [
                          TextSpan(text: dateTime.day.toString()),
                          const TextSpan(text: '/'),
                          TextSpan(text: dateTime.month.toString()),
                          const TextSpan(text: '/'),
                          TextSpan(text: dateTime.year.toString()),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}