import 'package:flutter/material.dart';

class CustomMedicalCardNurse extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onPressed;

  const CustomMedicalCardNurse(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 33,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFBBE2FF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(child: Image.asset(imagePath, height: 100, width: 100)),
              SizedBox(height: 10),
              Text(title,
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
            ],
          ),
          Positioned(
            bottom: 1,
            right: 1,
            child: InkWell(
              onTap: onPressed,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Color(0xFF1385E2),
                size: 23,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
