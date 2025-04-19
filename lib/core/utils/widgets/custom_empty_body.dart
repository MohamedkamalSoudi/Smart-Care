import 'package:flutter/material.dart';

class CustomEmptyBody extends StatelessWidget {
  final String title;
  const CustomEmptyBody({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/Patient in ward with doctors.png'),
          Text(title),
        ],
      ),
    );
  }
}
