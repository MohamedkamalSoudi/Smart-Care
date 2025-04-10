import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/home/widgets/custom_bottom_navgbar.dart';
import 'package:smart_care_app/features/doctor/home/widgets/patient_card_2.dart';
import 'package:smart_care_app/features/doctor/home/widgets/search_bar_text_field.dart';



class Patient {
  final String name;
  final String room;
  final int bedNumber;

  Patient({required this.name, required this.room, required this.bedNumber});
}

class PatientsListScreen extends StatefulWidget {
  @override
  _PatientsListScreenState createState() => _PatientsListScreenState();
}

class _PatientsListScreenState extends State<PatientsListScreen> {
  final List<Patient> _patients = [
    Patient(name: "Mohamed", room: "G101", bedNumber: 3),
    Patient(name: "Ziad", room: "G101", bedNumber: 3),
    Patient(name: "Maha", room: "G101", bedNumber: 3),
    Patient(name: "Loai", room: "G101", bedNumber: 3),
    Patient(name: "Ahmed", room: "G101", bedNumber: 3),
    Patient(name: "Mohamed", room: "G101", bedNumber: 3),
    Patient(name: "Ziad", room: "G101", bedNumber: 3),
    Patient(name: "Maha", room: "G101", bedNumber: 3),
    Patient(name: "Loai", room: "G101", bedNumber: 3),
    Patient(name: "Ahmed", room: "G101", bedNumber: 3),
  ];

  List<Patient> _filteredPatients = [];
  // ignore: unused_field
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredPatients = _patients; // Initialize filtered list with all patients
  }

  void _filterPatients(String query) {
    setState(() {
      _searchQuery = query;
      _filteredPatients = _patients.where((patient) {
        return patient.name.toLowerCase().contains(query.toLowerCase()) ||
            patient.room.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFBBE2FF),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Patients List', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SearchBarTextField(onChanged: _filterPatients),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _filteredPatients.length,
                itemBuilder: (context, index) {
                  return PatientCard(patient: _filteredPatients[index]);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(), // Use the custom bottom nav bar
    );
  }
}