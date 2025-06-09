import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_care_app/constant.dart';
import 'package:smart_care_app/features/common/login/presentation/views/role_based_home_screen.dart';
import '../../../login/presentation/views/login_view.dart';
import 'sliding_text.dart';
import '../../../onboarding/presentation/views/onboarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;
  @override
  void initState() {
    super.initState();

    initSlidingAnimation();
    navigateToHome();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 2), end: Offset.zero)
            .animate(animationController);
    animationController.forward();
  }

  void navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () async {
      // ignore: use_build_context_synchronously
      final sharedPref = await SharedPreferences.getInstance();
      final userType = sharedPref.getString('userType');
      final response = sharedPref.getBool('isClicked');
      response != true
          ? Navigator.pushReplacementNamed(context, OnboardingView.id)
          : token == ''
              ? Navigator.pushReplacementNamed(context, LoginView.id)
              : Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoleBasedHomeScreen(
                            userType: userType!,
                          )));
    });
  }
}
