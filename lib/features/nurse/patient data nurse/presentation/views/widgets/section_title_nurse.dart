import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';

class SectionTitleNurse extends StatelessWidget {
  final String title;

  const SectionTitleNurse({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.grey60,
      ),
    );
  }
}
