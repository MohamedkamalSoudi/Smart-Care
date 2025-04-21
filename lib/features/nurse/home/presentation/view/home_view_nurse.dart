import 'package:flutter/material.dart';
import 'package:smart_care_app/features/nurse/Rediology/rediology_view.dart';

import '../../../../doctor/home/presentation/views/widgets/home_view_appbar.dart';
import '../../../../doctor/home/presentation/views/widgets/home_view_body.dart';
import '../../../notification/presentation/view/notification_view.dart';

class HomeViewNurse extends StatelessWidget {
  const HomeViewNurse({super.key});
  static String id = 'HomeView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeViewAppbar(
          isNurse: true,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return RediologyView();
            }));
          }),
      body: HomeViewBody(),
    );
  }
}
