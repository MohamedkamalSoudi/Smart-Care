import 'package:flutter/material.dart';

class ImageSlider extends StatelessWidget {
  final List<String> imagePaths;
  final PageController pageController;

  ImageSlider({required this.imagePaths, required this.pageController});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
        controller: pageController,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 34.0),
            child: Image.asset(imagePaths[index]),
          );
        },
      ),
    );
  }
}