import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import '../../../../../core/utils/widgets/patient_data_appbar.dart';
import '../managers/rediology_details/rediology_details_cubit.dart';
import 'widgets/edit_profile_picture_view_body.dart';

class EditProfilePictureView extends StatelessWidget {
  const EditProfilePictureView(
      {super.key, required this.rediologyId, required this.patientId});
  final int rediologyId;
  final int patientId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RediologyDetailsCubit(rediologyId: rediologyId, patientId: patientId),
      child: Scaffold(
        backgroundColor: AppColors.whitebody,
        appBar: PatientDataAppbar(
          title: 'Edit Profile Picture',
          context: context,
        ),
        body: EditProfilePicturePageBody(
          rediologyId: rediologyId,
        ),
      ),
    );
  }
}
