import 'package:flutter/material.dart';

class CustomLogoView extends StatelessWidget {
  const CustomLogoView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Image.asset('assets/images/logo.png'),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(colors: [
            Color(0xff004173),
            Color(0xff6FD0F6),
            Color(0xff7FD0F7),
            Color(0xff5FDCF5),
          ], begin: Alignment.centerLeft, end: Alignment.centerRight)
              .createShader(bounds),
          child: Text(
            'Smart Care',
            style: TextStyle(
                fontSize: 55, fontWeight: FontWeight.w900, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
