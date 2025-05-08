import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/nurse/notification/presentation/view/notification_view.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../doctor/home/presentation/view_model/user_cubit.dart';
import '../../../../doctor/home/presentation/views/widgets/home_view_appbar.dart';
import '../../../../doctor/home/presentation/views/widgets/home_view_body.dart';

class HomeViewNurse extends StatelessWidget {
  const HomeViewNurse({super.key});
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..fetchUsers(),
      child: Scaffold(
        backgroundColor: AppColors.whitebody,
        appBar: homeViewAppbar(
            isNurse: true,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NotificationView();
              }));
            }),
        body: const HomeViewbody(),
      ),
    );
  }
}
