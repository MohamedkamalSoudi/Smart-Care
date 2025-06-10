import 'package:flutter/material.dart';
import 'package:smart_care_app/core/utils/widgets/patient_data_appbar.dart';
import '../../../../../core/utils/app_colors.dart';
import 'widgets/full_screen_image.dart';

class RediologyResult extends StatelessWidget {
  const RediologyResult({super.key});
  static const id = 'RediologyResult';

  @override
  Widget build(BuildContext context) {
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
                        FullScreenImage(imagePath: 'assets/images/bitmap.png'),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('assets/images/bitmap.png'),
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
