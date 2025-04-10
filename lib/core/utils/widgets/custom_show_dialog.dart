
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void customShowDialog(
    BuildContext context, TextEditingController controller, String hintText) {
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
                backgroundColor: Color.fromARGB(255, 27, 70, 102),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              onPressed: () {
                if (kDebugMode) {
                  print('Description: ${controller.text}');
                }
              },
              child: Center(
                  child: Text(
                'Add description',
                style: TextStyle(color: Colors.white),
              )),
            ),
          ),
        ],
      );
    },
  );
}
