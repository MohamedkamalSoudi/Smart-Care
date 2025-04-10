import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/widgets/custom_view.dart';

import '../../../../../core/utils/widgets/custom_show_dialog.dart';

class DescriptionView extends StatelessWidget {
  static const id = 'PatientDataPage1';
  const DescriptionView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomView(
      title: 'Description of the condition',
      isFloatingActive: true,
      body: Column(),
      onPressed: () {
        customShowDialog(
          context,
          TextEditingController(),
          'Enter Description of patient:',
        );
      },
    );
  }
}
