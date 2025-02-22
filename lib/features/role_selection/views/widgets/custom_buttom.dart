import 'package:flutter/material.dart';
import 'package:smart_care_app/features/login/views/login_view.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, required this.buttomName});
  final String buttomName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(context, LoginView.id),
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
              child: Text(
            buttomName,
            style: TextStyle(
                fontSize: 34, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
