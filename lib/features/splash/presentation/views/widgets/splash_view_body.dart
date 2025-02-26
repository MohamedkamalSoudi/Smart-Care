import 'package:flutter/material.dart';
import 'package:smart_care_app/features/logo/views/logo_view.dart';
import 'package:smart_care_app/features/role_selection/views/role_selection_view.dart';
import 'package:smart_care_app/features/splash/presentation/views/widgets/customwave_painter.dart';
import 'package:smart_care_app/features/splash/presentation/views/widgets/page_1.dart';
import 'package:smart_care_app/features/splash/presentation/views/widgets/page_2.dart';
import 'dot_indicator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF4490B6), Color(0xFF8ADBFB)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
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
                      } else if (index == 1) {
                        return SecondPage();
                      } else {
                        return LogoView();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          if (currentPage != 2)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomPaint(
                size: Size(double.infinity, 900),
                painter: CustomWavePainter(),
              ),
            ),
          Positioned(
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //SizedBox(width: MediaQuery.of(context).size.width /3.5),
                    DotIndicator(currentPage: currentPage, totalPages: 3),
                    Padding(
                      padding: const EdgeInsets.only(left: 80, right: 20),
                      child: GestureDetector(
                        onTap: () {
                          if (currentPage == 2) {
                            Navigator.pushReplacementNamed(
                                context, RoleSelectionView.id);
                          } else {
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
                ),
              ],
            ),
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
