import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/profile_narse_cubit.dart';
import 'profile_narse_view_body.dart';

class ProfileNarseView extends StatelessWidget {
  const ProfileNarseView({super.key});
  static const id = 'ProfileNarseView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileNarseCubit()..getProfileData(),
      child: Scaffold(
        body: ProfileNarseViewBody(),
      ),
    );
  }
}
