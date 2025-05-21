import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

class NoteItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  // final DateTime dateTime;
  const NoteItem(
      {super.key,
      required this.title,
      //   required this.dateTime,
      required this.onTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColors.cardDescription,
        borderRadius: BorderRadius.circular(16),
      ),
      height: 200,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Description',
                style: const TextStyle(color: Colors.white, fontSize: 26),
              ),
              InkWell(
                onTap: onTap,
                child: Image.asset('assets/images/editIcon.png'),
              ),
            ],
          ),
          SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          Spacer(),
          // RichText(
          //   textAlign: TextAlign.end,
          //   text: TextSpan(
          //     children: [
          //       TextSpan(text: dateTime.day.toString()),
          //       TextSpan(text: '/'),
          //       TextSpan(text: dateTime.month.toString()),
          //       TextSpan(text: '/'),
          //       TextSpan(text: dateTime.year.toString()),
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
