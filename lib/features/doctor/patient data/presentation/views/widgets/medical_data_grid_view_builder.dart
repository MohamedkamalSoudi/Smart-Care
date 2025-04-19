import 'package:flutter/material.dart';
import '../../../../description/presentation/views/description_view.dart';
import '../../../data/patient_ists.dart';
import 'custom_medical_card.dart';

class MedicalDataGridViewBuilder extends StatelessWidget {
  const MedicalDataGridViewBuilder({
    super.key,
  });

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
            Navigator.pushNamed(
              context, 
              DescriptionView.id,
              arguments: { 
                'title': medicalCardTitles[index],
                'image': medicalCardImages[index]
              }
            );
          },
        );
      },
    );
  }
}