import 'dart:developer';

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
            return Center(child: CircularProgressIndicator());
          } else if (state is NotificationLoaded) {
            final notifications = state.notifications;

            log(notifications.length.toString());
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: notifications.length,
                itemBuilder: (context, index) {
                  final item = notifications[index];
                  return CustomCard(
                    patientName: item.patient.name,
                    roomNumber: item.patient.roomNumber,
                    ped: item.patient.ped,
                    time: item.createdAt,
                  );
                },
              ),
            );
          } else if (state is NotificationError) {
            return Center(child: Text('حدث خطأ: ${state.message}'));
          } else {
            return Center(child: Text('لا توجد بيانات'));
          }
        },
      ),
    );
  }
}
