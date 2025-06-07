import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/widgets/custom_empty_body.dart';
import 'widgets/edit_profile_picture_view.dart';
import '../../../../../core/utils/widgets/patient_data_appbar.dart';
import '../managers/rediology_cubit.dart';
import '../managers/rediology_state.dart';
import 'widgets/custom_rediology_card.dart';

class RequiredRediologyViewAtNurse extends StatelessWidget {
  static const String id = 'RequiredRediologyViewAtNurse';

  const RequiredRediologyViewAtNurse({super.key});

  @override
  Widget build(BuildContext context) {
    final int patientId = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (context) => RediologyCubit()..fetchTests(patientId),
      child: Scaffold(
        backgroundColor: AppColors.whitebody,
        appBar:
            PatientDataAppbar(title: "Required  Rediologies", context: context),
        body: BlocBuilder<RediologyCubit, RediologyState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text("❌ Error: ${state.error}"));
            }

            if (state.isEmpty ||
                state.rediologies == null ||
                state.rediologies!.isEmpty) {
              return const CustomEmptyBody(
                  title: 'No  rediologies added until now');
            }

            return ListView.builder(
              itemCount: state.rediologies?.length ?? 0,
              itemBuilder: (context, index) {
                final rediologies = state.rediologies?[index];

                if (rediologies == null) {
                  return const SizedBox.shrink();
                }

                return CustomRediologyCard(
                  iconImage: "assets/images/ragb.svg",
                  testName: rediologies.name,
                  dueDate: rediologies.dueDate,
                  testId: rediologies.id,
                  filePath: rediologies.filePath,
                  isDone: rediologies.isDone,
                  onUploadPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePicturePage(),
                      ),
                    );
                  },
                  onDonePressed: () {
                    BlocProvider.of<RediologyCubit>(context)
                        .updateRediologyStatus(
                            rediologies.id, rediologies.isDone, patientId);
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
