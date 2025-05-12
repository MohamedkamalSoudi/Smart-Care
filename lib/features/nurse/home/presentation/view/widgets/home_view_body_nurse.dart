import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/home/data/patient_nurse_model.dart';
import 'package:smart_care_app/features/nurse/home/presentation/view/widgets/custom_bottom_navgbar_nurse.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../doctor/home/presentation/views/widgets/search_bar_text_field.dart';
import '../../manager/user_nurse_cubit.dart';
import '../../manager/user_nurse_state.dart';
import 'patient_card_nurse.dart';

class HomeViewBodyNurse extends StatefulWidget {
  const HomeViewBodyNurse({super.key});

  @override
  State<HomeViewBodyNurse> createState() => _HomeViewbodyState();
}

class _HomeViewbodyState extends State<HomeViewBodyNurse> {
  List<UserModelNurse> filteredPatients = [];
  String searchQuery = '';

  void _filterPatients(List<UserModelNurse> allPatients, String query) {
    setState(() {
      searchQuery = query;
      filteredPatients = allPatients.where((patient) {
        return patient.name!.toLowerCase().contains(query.toLowerCase()) ||
            patient.room!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitebody,
      bottomNavigationBar: const CustomBottomNavBarNurse(currentIndex: 0),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
        child: Column(
          children: [
            SearchBarTextField(
              onChanged: (value) {
                final cubit = context.read<UserNurseCubit>();
                if (cubit.state is UserNurseLoaded) {
                  final allPatients = (cubit.state as UserNurseLoaded).users;
                  _filterPatients(allPatients, value);
                }
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<UserNurseCubit, UserNurseState>(
                builder: (context, state) {
                  if (state is UserNurseLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserNurseLoaded) {
                    final allPatients = state.users;
                    final patientsToShow =
                        searchQuery.isEmpty ? allPatients : filteredPatients;

                    if (patientsToShow.isEmpty) {
                      return const Center(child: Text("لا توجد بيانات للعرض"));
                    }

                    return ListView.builder(
                      itemCount: patientsToShow.length,
                      itemBuilder: (context, index) {
                        return PatientCardNurse(patient: patientsToShow[index]);
                      },
                    );
                  } else if (state is UserNurseError) {
                    return Center(child: Text(state.message));
                  } else {
                    log('Unknown state: $state');
                    return const SizedBox.shrink();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
