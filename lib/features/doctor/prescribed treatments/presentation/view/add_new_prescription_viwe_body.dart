import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/widgets/custom_empty_body.dart';
import 'package:smart_care_app/core/utils/widgets/custom_view.dart';
import '../../../display prescription/presentation/views/widgets/taskcard.dart';
import '../manager/cubit/treatment_doctor_cubit.dart';
import '../manager/cubit/treatment_doctor_state.dart';
import 'widgets/medication_card.dart';

class AddNewPrescriptionViweBody extends StatelessWidget {
  static const id = 'AddNewPrescriptionViweBody';

  const AddNewPrescriptionViweBody({super.key});

  @override
  Widget build(BuildContext context) {
    final String patientIdStr =
        ModalRoute.of(context)!.settings.arguments as String;

    return BlocProvider(
      create: (context) =>
          TreatmentCubitDoctor()..fetchTreatments(int.parse(patientIdStr)),
      child: Scaffold(
        body: BlocConsumer<TreatmentCubitDoctor, TreatmentStateDoctor>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if (state is TreatmentLoaded) {
              return CustomView(
                title: "Add New Prescription",
                isFloatingActive: true,
                body: state.treatments.isEmpty
                    ? const CustomEmptyBody(
                        title: 'No Prescriptions added until now')
                    : ListView.builder(
                        itemCount: state.treatments.length,
                        itemBuilder: (context, index) {
                          final treatment = state.treatments[index];
                          return ConnectionStatusCard(
                            onDelete: () {
                              context
                                  .read<TreatmentCubitDoctor>()
                                  .deleteTreatment(
                                    treatment.id!,
                                    int.parse(patientIdStr),
                                    );
                            },
                            title: treatment.name,
                            connectionType: treatment.dosage ?? "No dosage",
                            timestamp: treatment.dueTime,
                            date: treatment.dueDate,
                            message: treatment.description ?? "No description",
                            isToggled: treatment.isDone,
                            onToggle: () {},
                          );
                        },
                      ),
                onPressed: () {
                  final cubit = context.read<TreatmentCubitDoctor>();
                  Navigator.pushNamed(
                    context,
                    MedicationCard.id,
                    arguments: {
                      'patientId': patientIdStr,
                      'cubit': cubit,
                    },
                  );
                },
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}