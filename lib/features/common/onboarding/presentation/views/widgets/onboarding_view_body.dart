import 'package:flutter/material.dart';
import 'customwave_painter.dart';
import 'page_1.dart';
import 'page_2.dart';
import 'onboarding_container_box_decoration.dart';
import 'welcome_onboarding_text_and_next_button.dart';

class OnboardingViewBody extends StatefulWidget {
  const OnboardingViewBody({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _OnboardingViewBodyState createState() => _OnboardingViewBodyState();
}

class _OnboardingViewBodyState extends State<OnboardingViewBody> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: onboardingcontainerBoxDecoration(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: 3,
                    onPageChanged: (index) {
                      setState(() {
                        currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return FirstPage();
                      } else {
                        return SecondPage();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CustomPaint(
              size: Size(double.infinity, 900),
              painter: CustomWavePainter(),
            ),
          ),
          WelcomeOnboardingTextAndNextButton(
            currentPage: currentPage,
            pageController: _pageController,
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
