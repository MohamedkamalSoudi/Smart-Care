import 'package:flutter/material.dart';

import 'widgets/home_view_appbar.dart';
import 'widgets/home_view_body.dart';

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
