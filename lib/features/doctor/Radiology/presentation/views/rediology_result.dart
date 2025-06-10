import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/widgets/custom_empty_body.dart';
import 'package:smart_care_app/core/utils/widgets/patient_data_appbar.dart';
import '../../../../../core/utils/app_colors.dart';
import 'widgets/full_screen_image.dart';

class RediologyResult extends StatelessWidget {
  const RediologyResult({super.key, required this.filePath});
  static const id = 'RediologyResult';
  final String? filePath;

  @override
  Widget build(BuildContext context) {
    final String baseUrl = 'http://smartcare.wuaze.com/public/';
    final String? imageUrl =
        (filePath != null && filePath!.isNotEmpty) ? '$baseUrl$filePath' : null;

    if (imageUrl == null) {
      return const Scaffold(
        body: CustomEmptyBody(title: 'No Rediology Result until now'),
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
                        FullScreenImage(imageProvider: imageProvider),
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
