import 'package:flutter/material.dart';
import 'package:smart_care_app/features/nurse/home/data/patient_nurse_model.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../doctor/patient data/presentation/views/widgets/section_title.dart';
import 'info_row.dart';
import 'room_number_nurse.dart';

class BasicInformationSectionNurse extends StatelessWidget {
  final UserModelNurse? model;
  const BasicInformationSectionNurse({super.key, this.model});
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
                RoomNumberNurse(model: model),
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
