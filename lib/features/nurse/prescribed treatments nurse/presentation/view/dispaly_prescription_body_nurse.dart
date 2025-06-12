import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/widgets/custom_empty_body.dart';
import 'package:smart_care_app/features/nurse/prescribed%20treatments%20nurse/manager/treatment_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/widgets/patient_data_appbar.dart';
import '../../manager/treatment_state.dart';
import 'widgets/taskcardnurse.dart';

class DisplayPrescriptionBodyNurse extends StatelessWidget {
  const DisplayPrescriptionBodyNurse({super.key});

  static const String id = 'DisplayPrescriptionBodyNurse';

  @override
  Widget build(BuildContext context) {
    final int patientId = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider(
      create: (context) => TreatmentCubit()..fetchTreatments(patientId),
      child: Scaffold(
        backgroundColor: AppColors.whitebody,
        appBar: PatientDataAppbar(
          title: "Prescribed Treatments",
          context: context,
        ),
        body: BlocBuilder<TreatmentCubit, TreatmentState>(
          builder: (context, state) {
            if (state is TreatmentLoaded) {
              final treatments = state.treatments;

              if (treatments.isEmpty) {
                return const CustomEmptyBody(title: 'No Treatments added until now');
              }

              return ListView.builder(
                itemCount: treatments.length,
                itemBuilder: (context, index) {
                  final treatment = treatments[index];
                  return ConnectionStatusCardNurse(
                    name: treatment.name,
                    connectionType: treatment.dosage ?? "No dosage",
                    timestamp: treatment.dueTime,
                    date: treatment.dueDate,
                    message: treatment.description ?? "No description",
                    isToggled: treatment.isDone,
                    onToggle: () {
                      BlocProvider.of<TreatmentCubit>(context).updateTestStatus(
                        treatment.id,
                        treatment.isDone,
                        patientId,
                      );
                    },
                  );
                },
              );
            } else if (state is TreatmentError) {
              return Center(child: Text("Error: ${state.message}"));
            }

            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
