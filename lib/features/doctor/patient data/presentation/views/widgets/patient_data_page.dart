import 'package:flutter/material.dart';
import '../../../../../../core/app_colors.dart';
import '../../../../../../core/utils/widgets/patient_data_appbar.dart';
import 'medical_data_grid_view_builder.dart';
import 'medical_details_card.dart';
import 'basic_information_section.dart';

class PatientDataPage extends StatelessWidget {
  const PatientDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitebody,
      appBar: patientDataAppbar(
        title: 'Patient Data',
        context: context,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            BasicInformationSection(),
            const SizedBox(height: 10),
            MedicalDetailsCard(),
            const SizedBox(height: 10),
            MedicalDataGridViewBuilder(),
          ],
        ),
      ),
    );
  }
}