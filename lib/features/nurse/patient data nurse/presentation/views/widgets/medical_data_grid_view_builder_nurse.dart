import 'package:flutter/material.dart';
import '../../../../description nurse/presentation/views/description_nurse_view.dart';
import '../../../../required tests nurse/presentation/views/required_tests_view.dart';
import '../../../../prescribed treatments nurse/presentation/add_new_prescription_nurse.dart';
import '../../../data/patient_ists_nurse.dart';
import 'custom_medical_card_nurse.dart';

class MedicalDataGridViewBuilderNurse extends StatelessWidget {
  final int patientId;

  MedicalDataGridViewBuilderNurse({
    super.key,
    required this.patientId,
  });

  final List<String> pageIds = [
    DescriptionNurseView.id,
    RequiredTestsViewNurse.id,
    RequiredTestsViewNurse.id,
    AddNewPrescriptionNurse.id,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: pageIds.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        final String route = pageIds[index];

        return CustomMedicalCardNurse(
          imagePath: medicalCardImages[index],
          title: medicalCardTitles[index],
          onPressed: () {
            if (route == DescriptionNurseView.id ||
                route == RequiredTestsViewNurse.id ||
                route == AddNewPrescriptionNurse.id) {
              Navigator.pushNamed(
                context,
                route,
                arguments: patientId,
              );
            } else {
              Navigator.pushNamed(context, route);
            }
          },
        );
      },
    );
  }
}