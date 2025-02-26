import 'package:flutter/material.dart';

import '../../logo/views/widgets/custom_logoview.dart';
import 'widgets/custom_buttom.dart';

class RoleSelectionView extends StatelessWidget {
  const RoleSelectionView({super.key});
  static String id = 'RoleSelectionView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBBE2FF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            CustomLogoView(),
            SizedBox(
              height: 80,
            ),
            CustomButtom(
              buttomName: 'Doctor',
            ),
            SizedBox(
              height: 20,
            ),
            CustomButtom(
              buttomName: 'Nurse',
            )
          ],
        ),
      ),
    );
  }
}
