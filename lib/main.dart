import 'package:flutter/material.dart';

import 'features/login/views/login_view.dart';
import 'features/logo/views/logo_view.dart';
import 'features/role_selection/views/role_selection_view.dart';
import 'features/splash/presentation/views/splash_view.dart';

void main() {
  runApp(const SmartCare());
}

class SmartCare extends StatelessWidget {
  const SmartCare({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        SplashView.id: (context) => SplashView(),
        LogoView.id: (context) => LogoView(),
        RoleSelectionView.id: (context) => RoleSelectionView(),
        LoginView.id: (context) => LoginView(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
    );
  }
}
