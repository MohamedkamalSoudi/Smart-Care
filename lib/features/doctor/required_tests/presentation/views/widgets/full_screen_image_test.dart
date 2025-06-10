import 'package:flutter/material.dart';

class FullScreenImageTest extends StatelessWidget {
    final ImageProvider imageProvider;

  const FullScreenImageTest({super.key, required this.imageProvider});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: InteractiveViewer(
            child: Image(
              image: imageProvider,
              fit: BoxFit.fitHeight,
              width: double.infinity,
              height: 700,
            ),
          ),
        ),
      ),
    );
  }
}