import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'package:smart_care_app/features/doctor/prescribed%20treatments/presentation/manager/cubit/treatment_doctor_cubit.dart';
import '../../../../../../core/utils/widgets/patient_data_appbar.dart';
import 'additional_notes_field.dart';
import 'dosage_field.dart';
import 'drug_name_field.dart';
import 'reminder_times_section.dart';
import 'save_button.dart';
import 'times_per_day_selector.dart';

class MedicationCard extends StatefulWidget {
  static const id = 'MedicationCard';
  final String patientId;
  final TreatmentCubitDoctor cubit;

  const MedicationCard({
    super.key,
    required this.patientId,
    required this.cubit,
  });

  @override
  State<MedicationCard> createState() => _MedicationCardState();
}

class _MedicationCardState extends State<MedicationCard> {
  int timesPerDay = 1;
  final List<TimeOfDay?> reminderTimes = [null, null, null];

  final TextEditingController drugNameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  void updateTimesPerDay(int value) {
    setState(() {
      timesPerDay = value;
    });
  }

  void updateTime(int index, TimeOfDay newTime) {
    setState(() {
      if (index < reminderTimes.length) {
        reminderTimes[index] = newTime;
      }
    });
  }

  void _onSave() {
  final name = drugNameController.text.trim();
  final dosage = dosageController.text.trim();
  final description = notesController.text.trim();

  final times = reminderTimes.where((t) => t != null).toList();

  if (times.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("اختر على الأقل وقت تنبيه واحد")),
    );
    return;
  }

  if (name.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("ادخل اسم الدواء")),
    );
    return;
  }

  if (dosage.isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("ادخل الجرعة")),
    );
    return;
  }

  final int? parsedPatientId = int.tryParse(widget.patientId);
  if (parsedPatientId == null) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("رقم المريض غير صحيح")),
    );
    return;
  }

  final formattedTimes = times.map((t) => t!.format(context)).toList();

  widget.cubit.addTreatment(
    patientId: parsedPatientId.toString(),
    name: name,
    dosage: dosage,
    description: description.isNotEmpty ? description : null,
    times: formattedTimes,
  );

  Navigator.pop(context);
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
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrugNameField(controller: drugNameController),
                  const Divider(height: 32),
                  DosageField(controller: dosageController),
                  const SizedBox(height: 16),
                  TimesPerDaySelector(
                    timesPerDay: timesPerDay,
                    onChanged: updateTimesPerDay,
                  ),
                  const Divider(height: 32),
                  ReminderTimesSection(
                    maxTimes: timesPerDay,
                    times: reminderTimes,
                    onTimeChanged: updateTime,
                  ),
                  const Divider(height: 32),
                  AdditionalNotesField(controller: notesController),
                  const SizedBox(height: 20),
                  SaveButton(onPressed: _onSave),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}