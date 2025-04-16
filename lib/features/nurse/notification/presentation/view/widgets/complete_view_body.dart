import 'package:flutter/material.dart';
import 'custom_complete_card.dart';

class CompleteViewBody extends StatelessWidget {
  const CompleteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return CustomCompleteCard();
          }),
    );
  }
}