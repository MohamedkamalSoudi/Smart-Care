import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'card_content.dart';
import 'card_actions.dart';
import 'green_line.dart';

class CustomTestCard extends StatelessWidget {
  const CustomTestCard({
    super.key,
    required this.iconImage,
    required this.testName,
    required this.dueDate,
    required this.isDone,
    required this.onDeletePressed,
    required this.onDonePressed,
  });

  final String iconImage;
  final String testName;
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
                color: Color(0xFF5F5F5F).withOpacity(0.15),
                offset: const Offset(-1, -1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GreenLine(isDone: isDone),
              const SizedBox(width: 10),
              Expanded(
                child: CardContent(
                  testName: testName,
                  formattedDate: dueDate,
                ),
              ),
              CardActions(
                iconImage: iconImage,
                isDone: isDone,
                onDeletePressed: onDeletePressed,
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