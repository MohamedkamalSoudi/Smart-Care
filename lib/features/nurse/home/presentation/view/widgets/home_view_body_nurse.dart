import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/home/data/patient_nurse_model.dart';
import 'package:smart_care_app/features/nurse/home/presentation/view/widgets/custom_bottom_navgbar_nurse.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../doctor/home/presentation/views/widgets/search_bar_text_field.dart';
import '../../../../../../core/shimmer/shimmer_home_skeleton.dart';
import '../../manager/user_nurse_cubit.dart';
import '../../manager/user_nurse_state.dart';
import 'patient_card_nurse.dart';

class HomeViewBodyNurse extends StatefulWidget {
  const HomeViewBodyNurse({super.key});

  @override
  State<HomeViewBodyNurse> createState() => _HomeViewBodyNurseState();
}

class _HomeViewBodyNurseState extends State<HomeViewBodyNurse> {
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

  Future<void> _refreshData() async {
    await context.read<UserNurseCubit>().fetchUsersNurse();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitebody,
      bottomNavigationBar: const CustomBottomNavBarNurse(currentIndex: 0),
      body: BlocBuilder<UserNurseCubit, UserNurseState>(
        builder: (context, state) {
          if (state is UserNurseLoading) {
            return const ShimmerHomeSkeleton();
          } else if (state is UserNurseLoaded) {
            final allPatients = state.users;
            final patientsToShow =
                searchQuery.isEmpty ? allPatients : filteredPatients;

            return RefreshIndicator(
              onRefresh: _refreshData,
              child: ListView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
                children: [
                  SearchBarTextField(
                    onChanged: (value) => _filterPatients(allPatients, value),
                  ),
                  const SizedBox(height: 10),
                  if (patientsToShow.isEmpty)
                    const Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: 40),
                        child: Text("No data available to display"),
                      ),
                    )
                  else
                    ...patientsToShow
                        .map((patient) => PatientCardNurse(patient: patient))
                        .toList(),
                ],
              ),
            );
          } else if (state is UserNurseError) {
            switch (state.type) {
              case 'no_internet':
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.wifi_off, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        "Please check your internet connection.",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              case 'server_error':
                return const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.cloud_off, size: 80, color: Colors.grey),
                      SizedBox(height: 16),
                      Text(
                        "Server error. Please try again later.",
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                );
              case 'empty_data':
                return const Center(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Text("No patients found."),
                  ),
                );
              default:
                return Center(child: Text(state.message));
            }
          } else {
            log('Unknown state: $state');
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
