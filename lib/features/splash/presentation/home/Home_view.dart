import 'package:flutter/material.dart';
import 'package:smart_care_app/features/splash/presentation/home/widgets/patients_data.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PatientsListScreen(),
    );
  }
}
