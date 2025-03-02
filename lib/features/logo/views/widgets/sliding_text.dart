import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset('assets/images/logo.png'),
                ShaderMask(
                  shaderCallback: (bounds) => LinearGradient(
                    colors: [
                      Color(0xff004173),
                      Color(0xff6FD0F6),
                      Color(0xff7FD0F7),
                      Color(0xff5FDCF5),
                    ],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ).createShader(bounds),
                  child: Text(
                    'Smart Care',
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}