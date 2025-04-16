import 'package:flutter/material.dart';

import 'custom_waiting_card.dart';

class WaitingViewBody extends StatelessWidget {
  const WaitingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return CustomWaitingCard();
          }),
    );
  }
}