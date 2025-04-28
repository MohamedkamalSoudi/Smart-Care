import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/widgets/custom_buttom.dart';
import 'package:smart_care_app/core/utils/widgets/shader_mask_widget.dart';
import 'package:smart_care_app/features/doctor/login/presentation/view_model/auth_cubit.dart';
import 'package:smart_care_app/features/doctor/login/presentation/view_model/auth_state.dart';
import 'package:smart_care_app/features/doctor/login/presentation/views/role_based_home_screen.dart';

import '../../../../../core/utils/widgets/custom_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFBBE2FF),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
            print(state.message);
          } else if (state is AuthLoading) {
            Center(child: CircularProgressIndicator());
          } else if (state is AuthAuthenticated) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RoleBasedHomeScreen(
                userType: state.userModel.userType,
                token: state.token,
              );
            }));
          } else {
            LoginView();
          }
          // TODO: implement listener
        },
        builder: (context, state) {
          return ListView(
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
                controller: context.read<AuthCubit>().userNameController,
                prefixIcon: Icons.email_outlined,
                hintText: 'Email',
              ),
              SizedBox(
                height: 7,
              ),
              CustomTextField(
                prefixIcon: Icons.lock_outlined,
                hintText: 'Password',
                controller: context.read<AuthCubit>().passwordController,
              ),
              SizedBox(
                height: 10,
              ),
              CustomButtom(
                buttomName: 'Login',
                onTap: () {
                  context.read<AuthCubit>().login();
                },
              )
            ],
          );
        },
      ),
    );
  }
}
