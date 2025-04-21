import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/assets.dart';

class FourthPage extends StatelessWidget {
  const FourthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 34.0),
              child: Image.asset(AssetsData.logo),
            ),
          ],
        ),
      ),
    );
  }
}
