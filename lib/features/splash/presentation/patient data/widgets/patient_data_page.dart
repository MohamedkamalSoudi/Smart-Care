import 'package:flutter/material.dart';
import 'package:smart_care_app/features/splash/presentation/patient%20data/widgets/custom_card.dart';
import 'package:smart_care_app/features/splash/presentation/patient%20data/widgets/top_info.dart';

class PatientDataPage extends StatelessWidget {
  const PatientDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new,
              color: Color.fromARGB(255, 108, 183, 241)),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text('Patient Data'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 5,
            color: Color(0xFFBBE2FF),
          ),
          SizedBox(height: 20),
          TopInfoWidget(name: 'Ahmed', age: 21, patientId: 'G101'),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: 5,
            color: Color(0xFFBBE2FF),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Medical Details:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                CustomCard(
                    imagePath: 'assets/images/Policy.png',
                    title: 'Description of the Condition', onPressed: () {  },),
                SizedBox(width: 10),
                CustomCard(
                    imagePath: 'assets/images/Lungs.png',
                    title: 'Radiology Required', onPressed: () {  },),
              ],
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Row(
              children: [
                CustomCard(
                    imagePath: 'assets/images/Flask.png',
                    title: 'Required Tests', onPressed: () {  },),
                SizedBox(width: 10),
                CustomCard(
                    imagePath: 'assets/images/Vitamin.png',
                    title: 'Prescribed Treatments', onPressed: () {  },),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
