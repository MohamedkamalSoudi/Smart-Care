import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/patient%20data/presentation/views/widgets/top_info.dart';

import 'medical_data_grid_view_builder.dart';
import 'patient_data_appbar.dart';

class PatientDataPage extends StatelessWidget {
  const PatientDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: patientDataAppbar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 20,
        children: [
          Divider(color: Color(0xFFBBE2FF), thickness: 5),
          TopInfoWidget(name: 'Ahmed', age: 21, patientId: 'G101'),
          Divider(color: Color(0xFFBBE2FF), thickness: 5),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Medical Details:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          MedicalDataGridViewBuilder(),
        ],
      ),
    );
  }
}
