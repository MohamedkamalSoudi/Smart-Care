import 'package:flutter/material.dart';
import 'package:smart_care_app/features/logo/views/widgets/custom_logoview.dart';
import 'package:smart_care_app/features/role_selection/views/widgets/custom_buttom.dart';

import 'widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBBE2FF),
      body: ListView(
        children: [
          CustomLogoView(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 34,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CustomTextField(
            prefixIcon: Icons.email_outlined,
            hintText: 'Email',
          ),
          SizedBox(
            height: 5,
          ),
          CustomTextField(
            prefixIcon: Icons.lock_outlined,
            hintText: 'Password',
          ),
          CustomButtom(buttomName: 'Login'),
        ],
      ),
    );
  }
}
