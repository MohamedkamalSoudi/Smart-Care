import 'package:flutter/material.dart';
import 'package:smart_care_app/core/app_colors.dart';

void customShowDialog(BuildContext context, TextEditingController controller,
    String hintText, Function() onPressed, String titel) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: TextField(
          controller: controller,
          maxLines: null, // This allows the text field to be multiline
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: BorderSide(color: Color(0xFFBBE2FF)),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: onPressed,
              child: Center(
                  child: Text(
                titel,
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      );
    },
  );
}
