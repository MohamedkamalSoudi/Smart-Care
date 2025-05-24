import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'package:smart_care_app/features/doctor/Radiology/presentation/views/widgets/green_line_%20radiology_card.dart';
import 'package:smart_care_app/features/doctor/Radiology/presentation/views/widgets/radiology_card_actions.dart';
import 'package:smart_care_app/features/doctor/Radiology/presentation/views/widgets/radiology_card_content.dart';

class CustomRadiologyCardBody extends StatelessWidget {
  const CustomRadiologyCardBody({
    super.key,
    required this.iconImage,
    required this.radiologyName,
    required this.dueDate,
    required this.isDone,
    required this.onDeletePressed,
    required this.onDonePressed,
  });

  final String iconImage;
  final String radiologyName;
  final String dueDate;
  final bool isDone;
  final VoidCallback onDeletePressed;
  final VoidCallback onDonePressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.whitebody,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                offset: const Offset(4, 4),
                blurRadius: 2,
              ),
              BoxShadow(
                color: const Color(0xFF5F5F5F).withOpacity(0.15),
                offset: const Offset(-1, -1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreenLineRadiologyCard(isDone: isDone),
              const SizedBox(width: 10),
              Expanded(
                child: RadiologyCardContent(
                  radiologyName: radiologyName,
                  formattedDate: dueDate,
                ),
              ),
              RadiologyCardActions(
                iconImage: iconImage,
                isDone: isDone,
                onDeletePressed: onDeletePressed,
                onDonePressed: onDonePressed,
              ),
            ],
          ),
        ),
        Divider(
          color: AppColors.grey200,
          thickness: 0.5,
          indent: 50,
          endIndent: 50,
        ),
      ],
    );
  }
}
