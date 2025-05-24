import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/Radiology/presentation/views/widgets/custom_radiology_card_body.dart';

class CustomRadiologyCard extends StatelessWidget {
  const CustomRadiologyCard({
    super.key,
    required this.iconImage,
    required this.colorIcon,
  });

  final String iconImage;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        final bool isDone = index % 2 == 0;
        final String date = 'May ${20 + index}, 2025';

        return CustomRadiologyCardBody(
          iconImage: iconImage,
          radiologyName: 'Radiology ${index + 1}',
          dueDate: date,
          isDone: isDone,
          onDeletePressed: () {
            print('Deleted Radiology ${index + 1}');
          },
          onDonePressed: () {
            print('Done Radiology ${index + 1}');
          },
        );
      },
    );
  }
}
