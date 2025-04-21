import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/assets.dart';

import '../../../../core/utils/widgets/custom_buttom.dart';
import '../../../../core/utils/widgets/shader_mask_widget.dart';

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
            SizedBox(height: 60),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset(AssetsData.logo),
                  ShaderMaskWidget(),
                ],
              ),
            ),
            SizedBox(height: 60),
            CustomButtom(buttomName: 'Doctor'),
            SizedBox(height: 18),
            CustomButtom(buttomName: 'Nurse')
          ],
        ),
      ),
    );
  }
}
