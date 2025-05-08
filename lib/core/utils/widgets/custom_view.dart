import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'patient_data_appbar.dart';

class CustomView extends StatelessWidget {
  final String title;
  final bool isFloatingActive;
  final Function() onPressed;
  final Widget body;

  const CustomView({
    super.key,
    required this.title,
    required this.isFloatingActive,
    required this.body,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitebody,
      appBar: PatientDataAppbar(title: title, context: context),
      body: body,
      floatingActionButton: isFloatingActive
          ? FloatingActionButton(
              backgroundColor: AppColors.blue,
              onPressed: onPressed,
              child: Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }
}
