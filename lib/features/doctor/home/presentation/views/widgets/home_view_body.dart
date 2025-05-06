import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/app_colors.dart';

import '../../../../../../core/utils/widgets/patient_card.dart';
import '../../../data/patient_model.dart';
import '../../view_model/user_cubit.dart';
import '../../view_model/user_state.dart';
import 'custom_bottom_navgbar.dart';
import 'search_bar_text_field.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whitebody,
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 0),
      body: Padding(
        padding: const EdgeInsets.only(top: 45, left: 10, right: 10),
        child: Column(
          children: [
            SearchBarTextField(
              onChanged: (value) {
                final cubit = context.read<UserCubit>();
                if (cubit.state is UserLoaded) {
                  final allPatients = (cubit.state as UserLoaded).users;
                  _filterPatients(allPatients, value);
                }
              },
            ),
            const SizedBox(height: 10),
            Expanded(
              child: BlocBuilder<UserCubit, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is UserLoaded) {
                    final allPatients = state.users;
                    final patientsToShow = searchQuery.isEmpty
                        ? allPatients
                        : filteredPatients;

                    if (patientsToShow.isEmpty) {
                      return const Center(child: Text("لا توجد بيانات للعرض"));
                    }

                    return ListView.builder(
                      itemCount: patientsToShow.length,
                      itemBuilder: (context, index) {
                        return PatientCard(patient: patientsToShow[index]);
                      },
                    );
                  } else if (state is UserError) {
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
