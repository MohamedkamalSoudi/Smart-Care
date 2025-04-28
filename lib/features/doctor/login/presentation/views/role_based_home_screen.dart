import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/home/presentation/views/home_view.dart';
import 'package:smart_care_app/features/nurse/home/presentation/view/home_view_nurse.dart';

class RoleBasedHomeScreen extends StatelessWidget {
  const RoleBasedHomeScreen({required this.userType, required this.token});
  final String userType;
  final String token;
  @override
  Widget build(BuildContext context) {
    if (userType == 'doctor') {
      return HomeViewDoctor();
    } else if (userType == 'nurse') {
      return HomeViewNurse();
    } else {
      return Scaffold(
        appBar: AppBar(title: Text("Unknown Role")),
        body: Center(
          child: Text("No access screen defined for role: $userType"),
        ),
      );
    }
  }
}
