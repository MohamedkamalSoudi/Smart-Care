import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/required%20tests%20nurse/presentation/views/widgets/custom_test_card.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/widgets/custom_empty_body.dart';
import 'edit_profile_picture_view.dart';
import '../../../../../core/utils/widgets/patient_data_appbar.dart';
import '../managers/test_cubit/test_cubit.dart';
import '../managers/test_cubit/test_state.dart';

class RequiredTestsViewAtNurse extends StatelessWidget {
  static const String id = 'RequiredTestsViewAtNurse';

  const RequiredTestsViewAtNurse({super.key});

  @override
  Widget build(BuildContext context) {
    final int patientId = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (context) => TestCubit()..fetchTests(patientId),
      child: Scaffold(
        backgroundColor: AppColors.whitebody,
        appBar: PatientDataAppbar(title: "Required Tests", context: context),
        body: BlocBuilder<TestCubit, TestState>(
          builder: (context, state) {
            if (state.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state.error != null) {
              return Center(child: Text("❌ Error: ${state.error}"));
            }

            if (state.isEmpty || state.tests == null || state.tests!.isEmpty) {
              return const CustomEmptyBody(title: 'No tests added until now');
            }

            return ListView.builder(
              itemCount: state.tests?.length ?? 0,
              itemBuilder: (context, index) {
                final test = state.tests?[index];

                if (test == null) {
                  return const SizedBox.shrink();
                }

                return CustomTestCardAtNurse(
                  iconImage: "assets/images/ragb.svg",
                  testName: test.name,
                  dueDate: test.dueDate,
                  testId: test.id,
                  filePath: test.filePath,
                  isDone: test.isDone,
                  onUploadPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditProfilePictureView(
                          patientId: patientId,
                          testId: test.id,
                        ),
                      ),
                    );
                  },
                  onDonePressed: () {
                    BlocProvider.of<TestCubit>(context)
                        .updateTestStatus(test.id, test.isDone, patientId);
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
