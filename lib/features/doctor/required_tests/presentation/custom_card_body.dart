import 'package:flutter/material.dart';

import 'views/widgets/custom_test_card.dart';

class CustomCardBody extends StatelessWidget {
  const CustomCardBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return CustomTestCard();
      }
    );
  }
}