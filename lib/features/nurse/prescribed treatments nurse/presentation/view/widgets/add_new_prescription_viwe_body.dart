import 'package:flutter/material.dart';
import '../../../../../../core/utils/widgets/patient_data_appbar.dart';
import 'dispaly_prescription_body_nurse.dart';

class AddNewPrescriptionViweBodyNurse extends StatelessWidget {
  const AddNewPrescriptionViweBodyNurse({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  PatientDataAppbar(title: "Add New Prescription", context: context),
        body: 
          DisplayPrescriptionBodyNurse(),
    );        
  }
}
