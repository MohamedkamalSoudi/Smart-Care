import 'package:flutter/material.dart';
import '../../../../../../core/app_colors.dart';
import 'info_row.dart';
import 'room_number.dart';
import 'section_title.dart';

class BasicInformationSection extends StatelessWidget {
  const BasicInformationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.whitebody,
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SectionTitle(title: 'Basic Information'),
            const Divider(height: 16),
            Row(
              children: [
                InfoRow(label: 'Name:', value: 'Ahmed'),
                const Spacer(),
                roomnumber(),
              ],
            ),
            InfoRow(label: 'Age:', value: '21'),
            const SizedBox(height: 10),
            
          ],
        ),
      ),
    );
  }
}

