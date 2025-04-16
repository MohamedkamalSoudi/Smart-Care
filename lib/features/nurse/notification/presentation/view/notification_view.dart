import 'package:flutter/material.dart';

import 'widgets/notification_view_body.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9ADCF6),
        leading: Icon(
          Icons.arrow_back_ios,
        ),
        title: Text(
          'Notificatios',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: NotificationViewBody(),
    );
  }
}
