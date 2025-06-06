import 'package:flutter/material.dart';
import '../data/treatment_nurse_model.dart';
import 'views/widgets/custom_test_card.dart' show CustomTestCardNurse;

class CustomCardNurseBody extends StatelessWidget {
  final List<NurseTreatmentModel> tests;
  final String iconImage;

  const CustomCardNurseBody({
    super.key,
    required this.tests,
    required this.iconImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: tests.map((test) {
        return CustomTestCardNurse(
          iconImage: iconImage,
          testName: test.name,
          dueDate: test.dueDate,
          isDone: test.isDone,
          filePath: test.filePath,
          testId: test.id,
          onUploadPressed: () {},
          onDonePressed: () {},
        );
      }).toList(),
    );
  }
}
