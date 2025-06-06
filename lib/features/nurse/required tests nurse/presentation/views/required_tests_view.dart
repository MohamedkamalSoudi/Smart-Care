import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/widgets/custom_empty_body.dart';
import 'widgets/edit_profile_picture_view.dart';
import '../../../../../core/utils/widgets/patient_data_appbar.dart';
import '../managers/nurse_test_cubit.dart';
import '../managers/nurse_test_state.dart';
import 'widgets/custom_test_card.dart';

class RequiredTestsViewNurse extends StatelessWidget {
  static const String id = 'RequiredTestsViewNurse';

  const RequiredTestsViewNurse({super.key});

  @override
  Widget build(BuildContext context) {
    final int patientId = ModalRoute.of(context)!.settings.arguments as int;
    return BlocProvider(
      create: (context) => NurseTestCubit()..fetchTests(patientId),
      child: Scaffold(
        backgroundColor: AppColors.whitebody,
        appBar: PatientDataAppbar(title: "Required Tests", context: context),
        body: BlocBuilder<NurseTestCubit, NurseTestState>(
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

                return CustomTestCardNurse(
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
                        builder: (context) => EditProfilePicturePage(),
                      ),
                    );
                  },
                  onDonePressed: () {
                    BlocProvider.of<NurseTestCubit>(context)
                        .toggleTestStatus(test.id, test.isDone, patientId);
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