import 'package:flutter/material.dart';
import 'package:smart_care_app/features/doctor/home/data/patient_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import 'info_row.dart';
import 'room_number.dart';
import 'section_title.dart';

class BasicInformationSection extends StatelessWidget {
  final UserModel? model;
  const BasicInformationSection({super.key, this.model});
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
                InfoRow(label: 'Name:', value: model?.name),
                const Spacer(),
                RoomNumber(model: model),
              ],
            ),
            InfoRow(label: 'Age:', value: model?.age),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
