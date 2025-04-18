import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/widgets/custom_buttom.dart';
import 'package:smart_care_app/core/utils/widgets/shader_mask_widget.dart';

import '../../../../core/utils/widgets/custom_text_field.dart';

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
                ShaderMaskWidget(),
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
