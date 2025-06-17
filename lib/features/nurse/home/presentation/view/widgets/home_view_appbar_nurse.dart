import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/core/utils/app_colors.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/view/notification_view.dart';
import '../../../../notification/presentation/manager/notification_cubit.dart';
import '../../../../notification/presentation/manager/notification_state.dart';

PreferredSizeWidget homeViewAppbarNurse() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: const Text(
            'Patients List',
            style: TextStyle(
              color: AppColors.grey60,
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: AppColors.whitebody,
          elevation: 0,
          centerTitle: true,
          actions: [
            BlocBuilder<NotificationCubit, NotificationState>(
              builder: (context, state) {
                int scheduleLength = 0;
                if (state is NotificationLoaded) {
                  scheduleLength = state.schedule.length;
                }

                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.notifications_none,
                        color: AppColors.iconhome,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NotificationView(),
                          ),
                        );
                      },
                    ),
                    if (scheduleLength > 0)
                      Positioned(
                        right: 6,
                        top: 6,
                        child: Container(
                          padding: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            shape: BoxShape.circle,
                          ),
                          constraints: const BoxConstraints(
                          ),
                          child: Center(
                            child: Text(
                              '$scheduleLength',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
          ],
        ),
        const Divider(
          height: 1.5,
          thickness: 1.5,
          color: AppColors.iconhome,
        ),
      ],
    ),
  );
}
