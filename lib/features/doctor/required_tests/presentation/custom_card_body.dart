import 'package:flutter/material.dart';
import 'views/widgets/custom_test_card.dart';

class CustomCardBody extends StatelessWidget {
  const CustomCardBody(
      {super.key, required this.iconImage, required this.colorIcon});
  final String iconImage;
  final Color colorIcon;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return CustomTestCard(
            iconImage: iconImage,
          );
        });
  }
}
