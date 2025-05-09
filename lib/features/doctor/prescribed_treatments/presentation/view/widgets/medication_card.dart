import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import '../../../../../../core/utils/widgets/patient_data_appbar.dart';
import 'additional_notes_field.dart';
import 'dosage_field.dart';
import 'drug_name_field.dart';
import 'reminder_times_section.dart';
import 'save_button.dart';
import 'times_per_day_selector.dart';

class MedicationCard extends StatefulWidget {
  static const id = 'MedicationCard';

  const MedicationCard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MedicationCardState createState() => _MedicationCardState();
}

class _MedicationCardState extends State<MedicationCard> {
  TimeOfDay? time1;
  TimeOfDay? time2;
  int timesPerDay = 2;

  void updateTime({required bool isFirst, required TimeOfDay newTime}) {
    setState(() {
      if (isFirst) {
        time1 = newTime;
      } else {
        time2 = newTime;
      }
    });
  }

  void updateTimesPerDay(int value) {
    setState(() {
      timesPerDay = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitebody,
      appBar: PatientDataAppbar(title: "Add New Prescription", context: context),
      body: Center(
        child: Card(
          color: AppColors.whitebody,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: BorderSide(color: Colors.grey.shade400),
          ),
          margin: EdgeInsets.all(16),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrugNameField(),
                  Divider(height: 32),
                  DosageField(),
                  SizedBox(height: 16),
                  TimesPerDaySelector(
                    timesPerDay: timesPerDay,
                    onChanged: updateTimesPerDay,
                  ),
                  Divider(height: 32),
                  ReminderTimesSection(
                    time1: time1,
                    time2: time2,
                    onTimeChanged: updateTime,
                  ),
                  Divider(height: 32),
                  AdditionalNotesField(),
                  SizedBox(height: 20),
                  SaveButton(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}