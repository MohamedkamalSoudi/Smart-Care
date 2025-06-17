import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/home/presentation/view/widgets/home_view_body_nurse.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/manager/notification_cubit.dart';
import '../../../../../core/utils/app_colors.dart';
import '../manager/user_nurse_cubit.dart';
import 'widgets/home_view_appbar_nurse.dart';

class HomeViewNurse extends StatelessWidget {
  const HomeViewNurse({super.key});
  static const id = 'HomeViewNurse';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserNurseCubit()..fetchUsersNurse(),
      child: BlocProvider(
        create: (_) => NotificationCubit()..fetchNotifications(),
        child: Scaffold(
          backgroundColor: AppColors.whitebody,
          appBar: homeViewAppbarNurse(),
          body: const HomeViewBodyNurse(),
        ),
      ),
    );
  }
}
