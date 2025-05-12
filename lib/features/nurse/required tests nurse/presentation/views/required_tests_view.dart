import 'package:flutter/material.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/widgets/patient_data_appbar.dart';
import '../custom_card_body.dart';


class RequiredTestsViewNurse extends StatelessWidget {
  static const id = 'RequiredTestsViewNurse';
  const RequiredTestsViewNurse({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whitebody,
        appBar: PatientDataAppbar(title: "Required Tests", context: context),
        body: 
        CustomCardNurseBody(
          iconImage: "assets/images/ragb.svg",
          colorIcon: AppColors.black,
        ),
    );
              
  }
}
