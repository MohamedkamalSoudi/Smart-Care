import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

import '../../../../display prescription/presentation/views/dispaly_prescription.dart';

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  const DisplayPrescription();
              }));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.symmetric(vertical: 14),
        ),
        child: Text(
          "Save",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppColors.whitebody),
        ),
      ),
    );
  }
}