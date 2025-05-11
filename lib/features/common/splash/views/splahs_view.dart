import 'package:flutter/material.dart';
import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static String id = 'splashView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBBE2FF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SplashViewBody(),
        ],
      ),
    );
  }
}
