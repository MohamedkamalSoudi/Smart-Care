import 'package:flutter/material.dart';

class DotIndicator extends StatelessWidget {
  final int currentPage;
  final int totalPages;

  DotIndicator({required this.currentPage, required this.totalPages});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPages,
        (index) => Container(
          height: 12,
          width: 12,
          margin: EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentPage == index ? Colors.black : Colors.transparent,
            border: Border.all(
              color: Colors.black,
              width: 1,
            ),
          ),
        ),
      ),
    );
  }
}