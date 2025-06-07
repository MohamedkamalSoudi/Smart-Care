import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../core/utils/widgets/custom_view.dart';
import '../../../../../core/utils/widgets/custom_empty_body.dart';
import '../../../../../core/utils/widgets/custom_show_dialog.dart';
import '../../data/test_model_at_doctor.dart';
import '../managers/tests_cubit.dart';
import '../managers/tests_states.dart';
import 'widgets/custom_test_card.dart';

class RequiredTestsView extends StatelessWidget {
  static const id = 'required_tests_view';

  const RequiredTestsView({super.key});

  @override
  Widget build(BuildContext context) {
    final String patientIdStr =
        ModalRoute.of(context)!.settings.arguments as String;
    final int patientId = int.parse(patientIdStr);

    return BlocProvider(
      create: (context) => TestCubit()..fetchTests(patientId),
      child: BlocConsumer<TestCubit, TestState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
          }
        },
        builder: (context, state) {
          return CustomView(
            title: 'Required Tests',
            isFloatingActive: !state.isLoading,
            body: _buildBody(state, patientId),
            onPressed: () {
              _showAddTestDialog(context, patientId);
            },
          );
        },
      ),
    );
  }

  Widget _buildBody(TestState state, int patientId) {
    if (state.isLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state.isEmpty) {
      return const CustomEmptyBody(title: 'No tests added until now');
    } else if (state.tests != null && state.tests!.isNotEmpty) {
      return ListView.builder(
        itemCount: state.tests!.length,
        itemBuilder: (context, index) {
          final test = state.tests![index];
          final formattedDate =
              DateFormat.yMMMMd().format(DateTime.parse(test.dueDate));
          return CustomTestCard(
            iconImage: 'assets/images/Vector.svg',
            testName: test.name,
            dueDate: formattedDate,
            isDone: test.isDone,
            onDeletePressed: () {
              context.read<TestCubit>().deleteTest(test.id, patientId);
            },
            onDonePressed: () {
              context
                  .read<TestCubit>()
                  .updateTestStatus(test.id, test.isDone, patientId);
            },
          );
        },
      );
    } else {
      return const CustomEmptyBody(title: 'No tests found');
    }
  }

  void _showAddTestDialog(BuildContext context, int patientId) {
    final nameController = TextEditingController();
    final cubit = context.read<TestCubit>();

    customShowDialog(
      context,
      nameController,
      'Enter test name:',
      () async {
        final testName = nameController.text.trim();
        if (testName.isEmpty) return;

        final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2024),
          lastDate: DateTime(2030),
        );

        if (selectedDate == null) return;

        final selectedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );

        if (selectedTime == null) return;

        final dueDate = DateFormat('yyyy-MM-dd').format(selectedDate);
        final dueTime =
            "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}";

        final request = CreateTestRequest(
          id: patientId,
          name: testName,
          dueDate: dueDate,
          dueTime: dueTime,
        );

        cubit.addTest(request, patientId);

        Navigator.pop(context);
      },
      'Add Test',
    );
  }
}
