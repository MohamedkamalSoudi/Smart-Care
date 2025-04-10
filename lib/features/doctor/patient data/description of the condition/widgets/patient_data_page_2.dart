import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/patient%20data/widgets/custom_elevated_button.dart';

class PatientDataPage2 extends StatelessWidget {
  const PatientDataPage2({super.key});
  static const id = 'PatientDataPage2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBE2FF),
      appBar: AppBar(
        title: const Text(
          'Description of the Condition',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Color(0xFF1385E2),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: CustomElevatedButton(
              onPressed: Navigator.of(context).pop,
              customRowElevatedButton: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'EDIT',
                    style: TextStyle(fontSize: 16, color: Colors.blue),
                  ),
                ],
              ),
            ),
          )
        ],
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
                    Center(
                      child: Text(
                        "السعودي تعبان بسبب دعوة الزرزور",
                        style: TextStyle(fontSize: 22, color: Colors.grey[800]),
                      ),
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
