import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../login/presentation/views/login_view.dart';
import 'dot_indicator.dart';

class CustomNextButton extends StatelessWidget {
  const CustomNextButton({
    super.key,
    required this.currentPage,
    required PageController pageController,
  }) : _pageController = pageController;

  final int currentPage;
  final PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        DotIndicator(currentPage: currentPage, totalPages: 3),
        Padding(
          padding: const EdgeInsets.only(left: 80, right: 20),
          child: GestureDetector(
            onTap: () async {
              if (currentPage == 1) {
                Navigator.pushReplacementNamed(context, LoginView.id);
              } else {
                final shaerdPref = await SharedPreferences.getInstance();
                shaerdPref.setBool('isClicked', true);
                _pageController.nextPage(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              }
            },
            child: Text(
              'Next',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
