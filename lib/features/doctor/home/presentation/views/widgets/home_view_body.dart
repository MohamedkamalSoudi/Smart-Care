import 'package:flutter/material.dart';
import 'package:smart_care_app/core/app_colors.dart';
import 'package:smart_care_app/features/doctor/home/presentation/views/widgets/custom_bottom_navgbar.dart';
import 'package:smart_care_app/core/utils/widgets/patient_card.dart';
import 'package:smart_care_app/features/doctor/home/presentation/views/widgets/search_bar_text_field.dart';

import '../../../data/patient_model.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewBodyState createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  List<Patient> _filteredPatients = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    _filteredPatients = patients; // Initialize filtered list with all patients
  }

  void _filterPatients(String query) {
    setState(() {
      searchQuery = query;
      _filteredPatients = patients.where((patient) {
        return patient.name.toLowerCase().contains(query.toLowerCase()) ||
            patient.room.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitebody,
      body: Padding(
        
        padding: const EdgeInsets.symmetric(horizontal: 16 , vertical: 40),
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
      bottomNavigationBar:
          CustomBottomNavBar(), // Use the custom bottom nav bar
    );
  }
}
