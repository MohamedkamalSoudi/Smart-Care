import 'package:flutter/material.dart';

import 'core/utils/app_routes.dart';
import 'features/splash/views/splahs_view.dart';

class SmartCare extends StatelessWidget {
  const SmartCare({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: appRoutes,
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
    );
  }
}
