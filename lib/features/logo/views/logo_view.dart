import 'package:flutter/material.dart';
import 'widgets/custom_logoview.dart';

class LogoView extends StatelessWidget {
  const LogoView({super.key});
  static String id = 'LogoView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBBE2FF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomLogoView(),
        ],
      ),
    );
  }
}
