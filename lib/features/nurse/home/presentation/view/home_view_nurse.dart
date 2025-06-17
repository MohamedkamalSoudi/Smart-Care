import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/home/presentation/view/widgets/home_view_body_nurse.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/manager/notification_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../manager/user_nurse_cubit.dart';
import 'widgets/home_view_appbar_nurse.dart';

class HomeViewNurse extends StatefulWidget {
  const HomeViewNurse({super.key});
  static const id = 'HomeViewNurse';

  @override
  State<HomeViewNurse> createState() => _HomeViewNurseState();
}

class _HomeViewNurseState extends State<HomeViewNurse> {
  late NotificationCubit _notificationCubit;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _notificationCubit = NotificationCubit();
    _notificationCubit.fetchNotifications();

    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _notificationCubit.fetchNotifications();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserNurseCubit()..fetchUsersNurse(),
        ),
        BlocProvider<NotificationCubit>.value(
          value: _notificationCubit,
        ),
      ],
      child: Scaffold(
        backgroundColor: AppColors.whitebody,
        appBar: homeViewAppbarNurse(),
        body: const HomeViewBodyNurse(),
      ),
    );
  }
}
