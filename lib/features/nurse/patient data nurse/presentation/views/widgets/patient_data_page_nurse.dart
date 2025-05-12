import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/widgets/patient_data_appbar.dart';
import '../../../../home/data/patient_nurse_model.dart';
import 'basic_information_section_nurse.dart';
import 'medical_data_grid_view_builder_nurse.dart';
import 'medical_details_card_nuser.dart';

class PatientDataPageNurse extends StatelessWidget {
  final UserModelNurse? model;
  const PatientDataPageNurse({super.key, this.model});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitebody,
      appBar: PatientDataAppbar(
        title: 'Patient Data',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BasicInformationSectionNurse(
              model: model,
            ),
            const SizedBox(height: 10),
            MedicalDetailsCardNuser(),
            const SizedBox(height: 10),
            MedicalDataGridViewBuilderNurse(),
          ],
        ),
      ),
    );
  }
}
