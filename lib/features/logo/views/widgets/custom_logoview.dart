import 'package:flutter/material.dart';
import 'package:smart_care_app/features/logo/views/widgets/sliding_text.dart';
import 'package:smart_care_app/features/splash/presentation/views/splash_view.dart';
class CustomLogoView extends StatefulWidget {
  const CustomLogoView({super.key});

  @override
  State<CustomLogoView> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<CustomLogoView>
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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, SplashView.id);
    });
  }
}