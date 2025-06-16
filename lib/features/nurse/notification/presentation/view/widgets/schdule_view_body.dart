import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/manager/notification_cubit.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/manager/notification_state.dart';
import 'custom_card.dart';

class SchduleViewBody extends StatelessWidget {
  const SchduleViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationCubit()..fetchNotifications(),
      child: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is NotificationError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is NotificationLoaded) {
            final notifications = state.schedule; // <-- تأكد أن هذا الحقل موجود
            if (notifications.isEmpty) {
              return const Center(child: Text("No schedule tasks"));
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final item = notifications[index];
                return CustomCard(
                  patientName: item.patient.name,
                  roomNumber: item.patient.roomNumber,
                  ped: item.patient.ped,
                  time: item.createdAt,
                  date: item.createdAt,
                  titel: item.title,
                  patientId: item.patient.patientId,
                  onWaiting: () =>
                      context.read<NotificationCubit>().moveToWaiting(item),
                  onComplete: () =>
                      context.read<NotificationCubit>().moveToComplete(item),
                );
              },
            );
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
