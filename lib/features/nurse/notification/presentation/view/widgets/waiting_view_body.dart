import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/manager/notification_cubit.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/manager/notification_state.dart';
import 'custom_waiting_card.dart';

class WaitingViewBody extends StatelessWidget {
  const WaitingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        if (state is NotificationLoaded) {
          final waiting = state.waiting;
          if (waiting.isEmpty) {
            return const Center(
              child: Text('لا توجد مهام في الانتظار'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: waiting.length,
            itemBuilder: (context, index) {
              final item = waiting[index];
              return CustomWaitingCard(
                patientName: item.patient.name,
                roomNumber: item.patient.roomNumber,
                ped: item.patient.ped,
                date: item.createdAt,
                time: item.createdAt,
                onComplete: () =>
                    context.read<NotificationCubit>().moveToComplete(item),
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
