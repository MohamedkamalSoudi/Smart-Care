import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'package:smart_care_app/core/utils/widgets/patient_data_appbar.dart';
import 'package:smart_care_app/features/doctor/required_tests/presentation/custom_card_body.dart';

class RediologyView extends StatelessWidget {
  const RediologyView({super.key});
  static const String id = "RediologyView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PatientDataAppbar(
        title: "Required Rediology",
        context: context,
      ),
      body: CustomCardBody(
        iconImage: "assets/images/ragb.svg",
        colorIcon: AppColors.black,
      ),
    );
  }
}
