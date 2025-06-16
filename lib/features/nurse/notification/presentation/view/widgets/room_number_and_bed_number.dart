import 'package:flutter/material.dart';

class RoomNumberAndBedNumber extends StatelessWidget {
  final String roomNumber;
  final String ped;
  const RoomNumberAndBedNumber({
    super.key,
    required this.roomNumber,
    required this.ped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Color(0xff4DADFB)),
      child: Row(
        spacing: 5,
        children: [
          Text(roomNumber),
          Container(
            height: 40,
            width: 10,
            color: Color(0xff9ADCF6),
          ),
          Text(ped),
        ],
      ),
    );
  }
}
