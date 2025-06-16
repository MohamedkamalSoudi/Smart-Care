import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/manager/notification_cubit.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/manager/notification_state.dart';
import 'custom_complete_card.dart';

class CompleteViewBody extends StatelessWidget {
  const CompleteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationCubit()..fetchNotifications(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoaded) {
            final complete = state.complete;
            if (complete.isEmpty) {
              return const Center(
                child: Text('لا توجد مهام مكتملة'),
              );
            }
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: complete.length,
              itemBuilder: (context, index) {
                final item = complete[index];
                return CustomCompleteCard(
                  name: item.patient.name,
                  patientName: item.patient.name,
                  roomNumber: item.patient.roomNumber,
                  ped: item.patient.ped,
                  date: item.createdAt,
                  time: item.createdAt,
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
