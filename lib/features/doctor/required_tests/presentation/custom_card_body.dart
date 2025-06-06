import 'package:flutter/material.dart';
import 'views/widgets/custom_test_card.dart';

class CustomCardBody extends StatelessWidget {
  const CustomCardBody({
    super.key,
    required this.iconImage,
    required this.colorIcon,
  });

  final String iconImage;
  final Color colorIcon;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final bool isDone = index % 2 == 0; 
        final String date = 'May ${20 + index}, 2025';

        return CustomTestCard(
          iconImage: iconImage,
          testName: 'Test ${index + 1}',
          dueDate: date,
          isDone: isDone,
          onDeletePressed: () {
            print('Deleted Test ${index + 1}');
          },
          onDonePressed: () {
            print('Done Test ${index + 1}');
          },
        );
      },
    );
  }
}
