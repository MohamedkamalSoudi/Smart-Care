import 'package:flutter/material.dart';
import 'package:smart_care_app/features/nurse/required%20tests%20nurse/presentation/views/required_tests_view.dart';
import '../../../../description nurse/presentation/views/description_nurse_view.dart';
import '../../../../prescribed treatments nurse/presentation/add_new_prescription_nurse.dart';
import '../../../data/patient_ists_nurse.dart';
import 'custom_medical_card_nurse.dart';

class MedicalDataGridViewBuilderNurse extends StatelessWidget {
  MedicalDataGridViewBuilderNurse({
    super.key,
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
      itemCount: medicalCardTitles.length, 
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.9, 
      ),
      itemBuilder: (context, index) {
        return CustomMedicalCardNurse(
          imagePath: medicalCardImages[index],
          title: medicalCardTitles[index],
          onPressed: () {
            if (index < pageIds.length) {
              Navigator.pushNamed(
                context, 
                pageIds[index], 
              );
            }
          },
        );
      },
    );
  }
}