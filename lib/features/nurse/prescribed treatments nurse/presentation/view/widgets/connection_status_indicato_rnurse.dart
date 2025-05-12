import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';

class ConnectionStatusIndicatorNurse extends StatelessWidget {
  final bool isToggled;

  const ConnectionStatusIndicatorNurse({super.key, required this.isToggled});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Container(
          width: 4,
          height: double.infinity,
          decoration: BoxDecoration(
            color: isToggled ? Colors.green : AppColors.blue,
          ),
        ),
      ),
    );
  }
}