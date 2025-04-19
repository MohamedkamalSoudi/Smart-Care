import 'package:flutter/material.dart';
import '../../../../../../core/app_colors.dart';
import 'info_row.dart';
import 'section_title.dart';

class BasicInformationSection extends StatelessWidget {
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
            InfoRow(label: 'Name:', value: 'Ahmed'),
            InfoRow(label: 'Age:', value: '21'),
            const SizedBox(height: 10),
            _buildGroupInfo(),
          ],
        ),
      ),
    );
  }

  /// Builds the group info widget with G101 and 3
  Widget _buildGroupInfo() {
    return Row(
      children: [
        Spacer(),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: const Color(0xff4DADFB),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'G101',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Container(
                height: 40,
                width: 10,
                color: const Color(0xffDEDEDE),
              ),
              const SizedBox(width: 5),
              Text(
                '3',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}