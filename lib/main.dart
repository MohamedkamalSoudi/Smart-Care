import 'package:flutter/material.dart';
import 'package:smart_care_app/features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const SmartCare());
}

class SmartCare extends StatelessWidget {
  const SmartCare({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashView(),
    );
  }
}
