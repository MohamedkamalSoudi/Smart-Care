import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';

import '../../../../../core/utils/widgets/patient_data_appbar.dart';
import '../managers/test_details/test_details_cubit.dart';
import 'widgets/edit_profile_picture_view_body.dart';

class EditProfilePictureView extends StatelessWidget {
  const EditProfilePictureView({super.key, required this.testId, required this.patientId});
  final int testId;
  final int patientId ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TestDetailsCubit(testId: testId, patientId: patientId),
      child: Scaffold(
        backgroundColor: AppColors.whitebody,
        appBar: PatientDataAppbar(
          title: 'Add Test Image',
          context: context,
        ),
        body: EditProfilePicturePageBody(
          testId: testId,
        ),
      ),
    );
  }
}
