import 'package:flutter/material.dart';
import 'package:smart_care_app/features/nurse/prescribed%20treatments%20nurse/presentation/view/widgets/taskcardnurse.dart';

import '../../../../../../core/utils/app_colors.dart';
class DisplayPrescriptionBodyNurse extends StatefulWidget {
  const DisplayPrescriptionBodyNurse({super.key});

  static const String id = 'DisplayPrescriptionBodyNurse';

  @override
  State<DisplayPrescriptionBodyNurse> createState() => _DisplayPrescriptionBodyNurseState();
}

class _DisplayPrescriptionBodyNurseState extends State<DisplayPrescriptionBodyNurse> {
  final List<bool> cardsToggleState = List.generate(10, (index) => false);

  void _toggleCard(int index) {
    setState(() {
      cardsToggleState[index] = !cardsToggleState[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitebody,
        body: ListView.builder(
          itemCount: 10, 
          itemBuilder: (context, index) {
            return ConnectionStatusCardNurse(
              connectionType: 'Prescription ${index + 1}',
              timestamp: '${10 + index}:00 AM',
              date: '2023-05-${index + 1}',
              message: 'Prescription message ${index + 1}',
              isToggled: cardsToggleState[index],
              onToggle: () => _toggleCard(index),
            );
          },
        ),
    );
  }
}