import 'package:flutter/material.dart';

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
              height: 60,
            ),
            Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/logo.png'),
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Color(0xff004173),
                      Color(0xff6FD0F6),
                      Color(0xff7FD0F7),
                      Color(0xff5FDCF5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds),
                  child: Text(
                    'Smart Care',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
            SizedBox(
              height: 60,
            ),
            CustomButtom(
              buttomName: 'Doctor',
            ),
            SizedBox(
              height: 18,
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
