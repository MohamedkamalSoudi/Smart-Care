import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../notification/presentation/view/notification_view.dart';

PreferredSizeWidget homeViewAppbarNurse() {
  return PreferredSize(
    preferredSize: Size.fromHeight(60.0),
    child: Column(
      children: [
        AppBar(
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          title: Text(
            'Patients List',
            style: TextStyle(
                color: AppColors.grey60,
                fontSize: 26,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: AppColors.whitebody,
          elevation: 0,
          centerTitle: true,
          actions: [
            Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: Icon(Icons.notifications_none, color: AppColors.iconhome),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return NotificationView();
                    }));
                  },
                );
              },
            ),
            //SizedBox(width: 10),
          ],
        ),
        Divider(
          height: 1.5,
          thickness: 1.5,
          color: AppColors.iconhome,
        ),
      ],
    ),
  );
}