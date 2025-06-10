import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:smart_care_app/features/doctor/Radiology/data/radiology_model.dart';
import 'package:smart_care_app/features/doctor/Radiology/presentation/manager/radiology_cubit.dart';
import 'package:smart_care_app/features/doctor/Radiology/presentation/manager/radiology_states.dart';
import 'package:smart_care_app/features/doctor/Radiology/presentation/views/widgets/custom_radiology_card.dart';
import '../../../../../core/utils/widgets/custom_view.dart';
import '../../../../../core/utils/widgets/custom_empty_body.dart';
import '../../../../../core/utils/widgets/custom_show_dialog.dart';

class RequiredRadiologyViewAtDoctor extends StatelessWidget {
  static const id = 'RequiredRadiologyViewAtDoctor';

  const RequiredRadiologyViewAtDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    final String patientIdStr =
        ModalRoute.of(context)!.settings.arguments as String;
    final int patientId = int.parse(patientIdStr);

    return BlocProvider(
      create: (context) => RadiologyCubit()..fetchRadiologes(patientId),
      child: BlocConsumer<RadiologyCubit, RadiologyStates>(
        listener: (context, state) {
          if (state is RadiologyError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Error: ${state.error}")),
            );
          }
        },
        builder: (context, state) {
          return CustomView(
            title: 'Required  Radiology',
            isFloatingActive:
                state is RadiologyEmpty || state is RadiologySuccess,
            body: state is RadiologyLoading
                ? const Center(child: CircularProgressIndicator())
                : state is RadiologyEmpty
                    ? const CustomEmptyBody(
                        title: 'No Rediologies added until now')
                    : state is RadiologySuccess
                        ? ListView.builder(
                            itemCount: state.rediologies.length,
                            itemBuilder: (context, index) {
                              final radiology = state.rediologies[index];
                              final formattedDate = DateFormat.yMMMMd()
                                  .format(DateTime.parse(radiology.dueDate));
                              return CustomRadiologyCard(
                                filePath: radiology.filePath,
                                iconImage: 'assets/images/Vector.svg',
                                radiologyName: radiology.name,
                                dueDate: formattedDate,
                                isDone: radiology.isDone,
                                onDeletePressed: () {
                                  context
                                      .read<RadiologyCubit>()
                                      .deleteRadiology(radiology.id, patientId);
                                },
                                onDonePressed: () {
                                  context
                                      .read<RadiologyCubit>()
                                      .updateRadiologyStatus(radiology.id,
                                          radiology.isDone, patientId);
                                },
                              );
                            },
                          )
                        : const SizedBox(),
            onPressed: () {
              _showAddRadiologyDialog(context, patientId);
            },
          );
        },
      ),
    );
  }

  void _showAddRadiologyDialog(BuildContext context, int patientId) {
    final nameController = TextEditingController();
    final cubit = context.read<RadiologyCubit>();

    customShowDialog(
      context,
      nameController,
      'Enter radiology name:',
      () async {
        final radiologyName = nameController.text.trim();
        if (radiologyName.isEmpty) return;

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

        final request = CreateRadiologyRequest(
          id: patientId,
          name: radiologyName,
          dueDate: dueDate,
          dueTime: dueTime,
        );

        cubit.addRadiology(request, patientId);

        Navigator.pop(context);
      },
      'Add  Radiology',
    );
  }
}
