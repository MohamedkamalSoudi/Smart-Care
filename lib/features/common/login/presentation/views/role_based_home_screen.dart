import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/home/presentation/views/home_view_doctor.dart';
import 'package:smart_care_app/features/nurse/home/presentation/view/home_view_nurse.dart';

class RoleBasedHomeScreen extends StatelessWidget {
  const RoleBasedHomeScreen({
    super.key,
    required this.userType,
  });
  final String userType;

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
