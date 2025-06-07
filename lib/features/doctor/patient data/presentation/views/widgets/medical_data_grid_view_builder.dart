import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/description/presentation/views/description_view.dart';
import '../../../../Radiology/presentation/views/required_radiology_view.dart';
import '../../../../prescribed treatments/presentation/add_new_prescription.dart';
import '../../../../required_tests/presentation/views/required_tests_view.dart';
import '../../../data/patient_ists.dart';
import 'custom_medical_card.dart';

class MedicalDataGridViewBuilder extends StatelessWidget {
  final String patientId;

  MedicalDataGridViewBuilder({
    super.key,
    required this.patientId,
  });

  final List<String> pageIds = [
    DescriptionView.id,
    RequiredRadiologyViewAtDoctor.id,
    RequiredTestsViewAtDoctor.id,
    AddNewPrescription.id,
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: medicalCardTitles.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9,
      ),
      itemBuilder: (context, index) {
        return CustomMedicalCard(
          imagePath: medicalCardImages[index],
          title: medicalCardTitles[index],
          onPressed: () {
            if (index < pageIds.length) {
              Navigator.pushNamed(
                context,
                pageIds[index],
                arguments: patientId,
              );
            }
          },
        );
      },
    );
  }
}
