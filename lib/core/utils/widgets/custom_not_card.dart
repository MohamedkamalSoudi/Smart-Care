import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

class NoteItem extends StatelessWidget {
  final String title;
  final Function() onTap;
  final DateTime dateTime;  // التاريخ مطلوب

  const NoteItem({
    super.key,
    required this.title,
    required this.onTap,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      margin: const EdgeInsets.all(10),
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
              const Text(
                'Description',
                style: TextStyle(color: Colors.white, fontSize: 26),
              ),
              InkWell(
                onTap: onTap,
                child: Image.asset('assets/images/editIcon.png'),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
          const Spacer(),
          RichText(
            textAlign: TextAlign.end,
            text: TextSpan(
              children: [
                TextSpan(
                  text: dateTime.day.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const TextSpan(
                  text: '/',
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: dateTime.month.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
                const TextSpan(
                  text: '/',
                  style: TextStyle(color: Colors.white),
                ),
                TextSpan(
                  text: dateTime.year.toString(),
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
