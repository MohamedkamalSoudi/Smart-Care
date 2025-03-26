import 'package:flutter/material.dart';
import 'package:smart_care_app/features/splash/presentation/patient%20data/widgets/custom_elevated_button.dart';

import 'patient_data_page_1.dart';

class PatientDataPage2 extends StatelessWidget {
  const PatientDataPage2({super.key});
  static const id = 'PatientDataPage2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBE2FF),
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              'Description of the Condition',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(
              width: 16,
            ),
            CustomElevatedButton(
              onPressed: (context) {
                Navigator.of(context).pop();
              },
              CustomRowElevatedButton: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'EDIT',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
                side: const BorderSide(
                  color: Colors.blue,
                  width: 2,
                )),
            elevation: 4,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "Description of the Condition",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "السعودي تعبان بسبب دعوة الزرزور",
                      style: TextStyle(fontSize: 22, color: Colors.grey[800]),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
