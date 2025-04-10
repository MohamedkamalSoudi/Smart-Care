import 'package:flutter/material.dart';

import 'widgets/patients_data.dart';

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
