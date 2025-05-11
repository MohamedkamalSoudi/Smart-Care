import 'package:flutter/material.dart';

import 'custom_next_button.dart';

class WelcomeOnboardingTextAndNextButton extends StatelessWidget {
  const WelcomeOnboardingTextAndNextButton({
    super.key,
    required this.currentPage,
    required PageController pageController,
  }) : _pageController = pageController;

  final int currentPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Center(
            child: Text(
              currentPage == 0
                  ? 'Welcome To SmartCare'
                  : currentPage == 1
                      ? 'Patient Management And Monitoring Application'
                      : '',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 90,
          ),
          CustomNextButton(
            currentPage: currentPage,
            pageController: _pageController,
          ),
        ],
      ),
    );
  }
}
