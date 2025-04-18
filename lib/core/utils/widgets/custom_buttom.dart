import 'package:flutter/material.dart';

import '../../../features/nurse/home/presentation/view/home_view_nurse.dart';

class CustomButtom extends StatelessWidget {
  const CustomButtom({super.key, required this.buttomName});
  final String buttomName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return HomeViewNurse();
          }));
        },
        child: Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
              child: Text(
            buttomName,
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
