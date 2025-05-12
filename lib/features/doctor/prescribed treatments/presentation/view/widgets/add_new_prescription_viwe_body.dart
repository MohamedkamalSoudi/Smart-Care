import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/widgets/custom_empty_body.dart';
import 'package:smart_care_app/core/utils/widgets/custom_view.dart';
import 'medication_card.dart';


class AddNewPrescriptionViweBody extends StatelessWidget {
  const AddNewPrescriptionViweBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomView(
            title: "Add New Prescription",
            isFloatingActive: true,
            body: CustomEmptyBody( title: 'No Prescriptions added until now'),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return  MedicationCard();
              }));
            }));
  }
}
