import 'package:flutter/material.dart';
import '../../../../home/data/patient_model.dart';

class RoomNumber extends StatelessWidget {
  final UserModel? model;
  const RoomNumber({
    super.key,
    this.model,
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
            'G${model!.room}',
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
            model!.id.toString(),
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
