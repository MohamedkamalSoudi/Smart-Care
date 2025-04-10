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
    return Expanded(
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return CustomMedicalCard(
            imagePath: medicalCardImages[index],
            title: medicalCardTitles[index],
            onPressed: () {
              Navigator.pushNamed(context, DescriptionView.id);
            },
          );
        },
      ),
    );
  }
}
