import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/widgets/custom_buttom.dart';
import '../../../../../core/utils/widgets/shader_mask_widget.dart';
import '../manager/auth_cubit.dart';
import '../manager/auth_state.dart';
import 'role_based_home_screen.dart';
import '../../../../../core/utils/widgets/custom_text_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});
  static String id = 'LoginView';

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBE2FF),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthAuthenticated) {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RoleBasedHomeScreen(
                userType: state.userModel.userType,
                token: state.token,
              );
            }));
          }
        },
        builder: (context, state) {
          return ListView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset('assets/images/logo.png'),
                    const ShaderMaskWidget(),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 27,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 7),
              CustomTextField(
                controller: context.read<AuthCubit>().userNameController,
                prefixIcon: Icons.email_outlined,
                hintText: 'Email',
              ),
              const SizedBox(height: 7),
              CustomTextField(
                controller: context.read<AuthCubit>().passwordController,
                prefixIcon: Icons.lock_outlined,
                hintText: 'Password',
                obscureText: !_isPasswordVisible,
                suffixIcon: IconButton(
                  icon: Icon(
                    _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible = !_isPasswordVisible;
                    });
                  },
                ),
              ),
              const SizedBox(height: 10),
              CustomButtom(
                buttomName: 'Login',
                onTap: () {
                  context.read<AuthCubit>().login();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
