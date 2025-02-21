import 'package:flutter/material.dart';
import 'package:smart_care_app/features/splash/presentation/views/widgets/customwave_painter.dart';
import 'image_slider.dart';
import 'dot_indicator.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});
  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  int currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  List<String> textList = [
    'Welcome To SmartCare',
    'Patient Management and Monitoring Application',
  ]; 

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
              children: [
                ImageSlider(
                  imagePaths: [
                    'assets/images/doctor_1.png',
                    'assets/images/doctor_2.png',
                  ],
                  pageController: _pageController,
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
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Center( 
                  child: Text(
                    textList[currentPage], 
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
                    DotIndicator(currentPage: currentPage, totalPages: 3),
                    Padding(
                      padding: const EdgeInsets.only(left: 110, right: 20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            currentPage++;
                          });
                          if (currentPage == 2) {
                            Navigator.pushReplacementNamed(
                                context, '/nextScreen');
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