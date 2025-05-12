import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/widgets/custom_view.dart';
import '../../../../prescribed treatments/presentation/view/widgets/medication_card.dart';
import 'taskcard.dart';

class DisplayPrescriptionBody extends StatefulWidget {
  const DisplayPrescriptionBody({super.key});

  static const String id = 'DisplayPrescriptionBody';

  @override
  State<DisplayPrescriptionBody> createState() => _DisplayPrescriptionBodyState();
}

class _DisplayPrescriptionBodyState extends State<DisplayPrescriptionBody> {
  final List<bool> cardsToggleState = List.generate(10, (index) => false);

  void _toggleCard(int index) {
    setState(() {
      cardsToggleState[index] = !cardsToggleState[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomView(
        title: 'Display Prescription',
        isFloatingActive: true,
        body: ListView.builder(
          itemCount: 10, 
          itemBuilder: (context, index) {
            return ConnectionStatusCard(
              connectionType: 'Prescription ${index + 1}',
              timestamp: '${10 + index}:00 AM',
              date: '2023-05-${index + 1}',
              message: 'Prescription message ${index + 1}',
              isToggled: cardsToggleState[index],
              onToggle: () => _toggleCard(index),
            );
          },
        ),
        onPressed: () {
          Navigator.pushNamed(context, MedicationCard.id);
        },
      ),
    );
  }
}