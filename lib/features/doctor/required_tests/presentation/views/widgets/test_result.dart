import 'package:flutter/material.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/widgets/custom_empty_body.dart';
import '../../../../../../core/utils/widgets/patient_data_appbar.dart';
import 'full_screen_image_test.dart';

class TestResult extends StatelessWidget {
  const TestResult({super.key, this.filePath});

  static const id = 'test_result';
  final String? filePath;

  @override
  Widget build(BuildContext context) {
    final String baseUrl = 'http://smartcare.wuaze.com/public/';
    final String? imageUrl =
        (filePath != null && filePath!.isNotEmpty) ? '$baseUrl$filePath' : null;

    if (imageUrl == null) {
      return const Scaffold(
        backgroundColor: AppColors.whitebody,
        body: CustomEmptyBody(title: 'There Are No Test Results Until Now'),
      );
    }

    final ImageProvider imageProvider = NetworkImage(imageUrl);

    return Scaffold(
      backgroundColor: AppColors.whitebody,
      appBar: PatientDataAppbar(context: context, title: 'Rediology Result'),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 3,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) =>
                        FullScreenImageTest(imageProvider: imageProvider),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
