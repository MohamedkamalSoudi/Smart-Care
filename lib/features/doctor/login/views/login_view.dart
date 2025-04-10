import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/role_selection/views/widgets/custom_buttom.dart';

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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/logo.png'),
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Color(0xff004173),
                      Color(0xff6FD0F6),
                      Color(0xff7FD0F7),
                      Color(0xff5FDCF5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds),
                  child: Text(
                    'Smart Care',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Login',
              style: TextStyle(
                fontSize: 27,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 7,
          ),
          CustomTextField(
            prefixIcon: Icons.email_outlined,
            hintText: 'Email',
          ),
          SizedBox(
            height: 7,
          ),
          CustomTextField(
            prefixIcon: Icons.lock_outlined,
            hintText: 'Password',
          ),
          SizedBox(
            height: 10,
          ),
          CustomButtom(buttomName: 'Login'),
        ],
      ),
    );
  }
}
