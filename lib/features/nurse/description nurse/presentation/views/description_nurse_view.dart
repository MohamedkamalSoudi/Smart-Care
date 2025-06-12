import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/widgets/custom_empty_body.dart';
import '../../../../../core/utils/widgets/patient_data_appbar.dart';
import '../managers/description_cubit/description_nurse_cubit.dart';
import '../managers/description_cubit/description_nurse_states.dart';

class DescriptionNurseView extends StatelessWidget {
  static const id = 'DescriptionNurseView';

  const DescriptionNurseView({super.key});

  @override
  Widget build(BuildContext context) {
    final int patientId = ModalRoute.of(context)!.settings.arguments as int;

    return BlocProvider(
      create: (_) => DescriptionNurseCubit()..fetchDescriptionNurse(patientId),
      child: Scaffold(
        backgroundColor: AppColors.whitebody,
        appBar: PatientDataAppbar(
          title: 'Description of the condition',
          context: context,
        ),
        body: BlocBuilder<DescriptionNurseCubit, DescriptionNurseStates>(
          builder: (context, state) {
            if (state is DataFoundedNurse) {
              final DateTime dateTime = DateTime.now();

              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                  decoration: BoxDecoration(
                    color: AppColors.cardDescription,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Description',
                        style: TextStyle(color: Colors.white, fontSize: 26),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Text(
                            state.model.desc,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 16),
                            maxLines: null,
                            softWrap: true,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      RichText(
                        textAlign: TextAlign.end,
                        text: TextSpan(
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          children: [
                            TextSpan(
                                text: dateTime.day.toString().padLeft(2, '0')),
                            const TextSpan(text: '/'),
                            TextSpan(
                                text:
                                    dateTime.month.toString().padLeft(2, '0')),
                            const TextSpan(text: '/'),
                            TextSpan(text: dateTime.year.toString()),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is ErrorNurseState) {
              return Center(child: Text('Error: ${state.error}'));
            }
            else if (state is EmptyNurseState) {
              return const CustomEmptyBody(
                  title: 'No description added until now');
            
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
