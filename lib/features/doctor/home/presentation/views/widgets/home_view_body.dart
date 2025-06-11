import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'patient_card.dart';
import '../../../data/patient_model.dart';
import '../../manager/user_cubit.dart';
import '../../manager/user_state.dart';
import 'custom_bottom_navgbar.dart';
import 'search_bar_text_field.dart';
import '../../../../../../core/shimmer/shimmer_home_skeleton.dart';

class HomeViewbody extends StatefulWidget {
  const HomeViewbody({super.key});

  @override
  State<HomeViewbody> createState() => _HomeViewbodyState();
}

class _HomeViewbodyState extends State<HomeViewbody> {
  List<UserModel> filteredPatients = [];
  String searchQuery = '';

  void _filterPatients(List<UserModel> allPatients, String query) {
    setState(() {
      searchQuery = query;
      filteredPatients = allPatients.where((patient) {
        return patient.name!.toLowerCase().contains(query.toLowerCase()) ||
            patient.room!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  Future<void> _refreshData() async {
    await context.read<UserCubit>().fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitebody,
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
      body: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return const ShimmerHomeSkeleton();
          } else if (state is UserLoaded) {
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
                    ...patientsToShow.map(
                      (patient) => PatientCard(patient: patient),
                    ),
                ],
              ),
            );
          } else if (state is UserError) {
            if (state.type == 'no_internet') {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.wifi_off, size: 80, color: Colors.grey),
                    SizedBox(height: 16),
                    Text("No internet connection")
                  ],
                ),
              );
            } else if (state.type == 'server_error') {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_off, size: 80, color: Colors.grey),
                    SizedBox(height: 16),
                    Text(""),
                  ],
                ),
              );
            } else {
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
