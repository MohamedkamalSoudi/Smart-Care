import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/manager/notification_cubit.dart';

import 'widgets/schdule_view_body.dart';

class SchduleView extends StatelessWidget {
  const SchduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NotificationCubit()..fetchNotifications(),
      child: SchduleViewBody(),
    );
  }
}
