import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/assets.dart';

class CustomEmptyBody extends StatelessWidget {
  final String title;
  const CustomEmptyBody({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AssetsData.patientandbed),
          Text(title),
        ],
      ),
    );
  }
}
