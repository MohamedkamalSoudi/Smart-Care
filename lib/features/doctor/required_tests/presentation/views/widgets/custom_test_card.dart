import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

import 'card_actions.dart';
import 'card_content.dart';
import 'green_line.dart';

class CustomTestCard extends StatelessWidget {
  const CustomTestCard(
      {super.key, required this.iconImage,});
  final String iconImage;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCard(),
        Divider(
          color: AppColors.grey200,
          thickness: 0.5,
          indent: 50,
          endIndent: 50,
        ),
      ],
    );
  }

  Widget _buildCard() {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: AppColors.whitebody,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            offset: const Offset(4, 4),
            blurRadius: 2,
            spreadRadius: 0,
          ),
          BoxShadow(
            color: const Color.fromARGB(255, 95, 95, 95).withOpacity(0.15),
            offset: Offset(-1, -1),
            blurRadius: 0,
            spreadRadius: 0,
          ),
        ],
      ),
      margin: EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GreenLine(),
          SizedBox(width: 10),
          CardContent(),
          CardActions(
            iconImage: iconImage,
          ),
        ],
      ),
    );
  }
}
