

import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:smart_care_app/features/doctor/home/presentation/views/widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeViewAppbar(),
      body: HomeViewBody(),
    );
  }
}
