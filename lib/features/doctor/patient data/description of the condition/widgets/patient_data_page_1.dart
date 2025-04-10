import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/patient%20data/description%20of%20the%20condition/widgets/patient_data_page_2.dart';
import 'package:smart_care_app/features/doctor/patient%20data/widgets/custom_elevated_button.dart';

class PatientDataPage1 extends StatelessWidget {
  const PatientDataPage1({super.key});
  static const id = 'PatientDataPage1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBE2FF),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color.fromARGB(255, 108, 183, 241)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Description of the Condition',
          style: TextStyle(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomElevatedButton(
            onPressed: showDescriptionDialog,
            customRowElevatedButton: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  ' Edit Description Dialog',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          CustomElevatedButton(
            onPressed: (context) async {
              await Navigator.of(context).pushNamed(PatientDataPage2.id);
            },
            customRowElevatedButton: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '  Show Description Dialog',
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  void showDescriptionDialog(BuildContext context) {
    TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: TextField(
            controller: controller,
            maxLines: null, // This allows the text field to be multiline
            decoration: InputDecoration(
              hintText: 'Enter Description of the Condition',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed(PatientDataPage2.id);
                if (kDebugMode) {
                  print('Description: ${controller.text}');
                }
              },
              child: Center(child: Text('Ok')),
            ),
          ],
        );
      },
    );
  }
}
