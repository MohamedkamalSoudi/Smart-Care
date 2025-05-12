import 'package:flutter/material.dart';
import 'package:smart_care_app/features/nurse/required%20tests%20nurse/presentation/views/widgets/custom_test_card.dart';

class CustomCardNurseBody extends StatelessWidget {
  const CustomCardNurseBody(
      {super.key, required this.iconImage, required this.colorIcon});
  final String iconImage;
  final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomTestCardNurse(
            iconImage: iconImage,
          );
        });
  }
}
