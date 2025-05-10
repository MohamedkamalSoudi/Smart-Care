import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_care_app/features/doctor/login/presentation/view_model/auth_cubit.dart';
import 'package:smart_care_app/features/doctor/profile/presentation/managers/profile_cubit.dart';
import 'core/utils/app_routes.dart';
import 'features/splash/views/splahs_view.dart';

class SmartCare extends StatelessWidget {
  const SmartCare({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit(),
        ),
      ],
      child: MaterialApp(
        routes: appRoutes,
        debugShowCheckedModeBanner: false,
        initialRoute: SplashView.id,
      ),
    );
  }
}
