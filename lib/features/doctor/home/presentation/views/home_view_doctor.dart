import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/doctor/home/presentation/views/widgets/home_view_appbar.dart';
import 'package:smart_care_app/features/doctor/home/presentation/views/widgets/home_view_body.dart';

import '../manager/user_cubit.dart';

class HomeViewDoctor extends StatelessWidget {
  const HomeViewDoctor({super.key});
  static const id = 'HomeViewDoctor';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit()..fetchUsers(),
      child: Scaffold(
        appBar: homeViewAppbar(),
        body: HomeViewbody (),
      ),
    );
  }
}
