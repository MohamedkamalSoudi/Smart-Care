import 'package:flutter/material.dart';

class roomnumber extends StatelessWidget {
  const roomnumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xff4DADFB),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'G101',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 40,
                width: 10,
                color: const Color(0xffDEDEDE),
              ),
              const SizedBox(width: 5),
              Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
        
    
  
  }
}