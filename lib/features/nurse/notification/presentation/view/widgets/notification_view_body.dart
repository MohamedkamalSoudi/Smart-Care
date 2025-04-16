import 'package:flutter/material.dart';

import '../../../data/model/notification_model.dart';
import '../complete_view.dart';
import '../schdule_view.dart';
import '../waiting_view.dart';
import 'custom_tap_bar_button.dart';

class NotificationViewBody extends StatefulWidget {
  const NotificationViewBody({super.key});

  @override
  State<NotificationViewBody> createState() => _NotificationViewBodyState();
}

int selectedItem = 0;
List<TapBarModel> tapBar = [
  TapBarModel(text: 'Schdule', widget: SchduleView()),
  TapBarModel(text: 'complete', widget: CompleteView()),
  TapBarModel(text: 'waiting', widget: WaitingView()),
];

class _NotificationViewBodyState extends State<NotificationViewBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Color(0xff9ADCF6),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            spacing: 10,
            children: List.generate(tapBar.length, (index) {
              return Expanded(
                child: CustomTapBarButton(
                  text: tapBar[index].text,
                  isSelected: index == selectedItem,
                  onPressed: () {
                    selectedItem = index;
                    setState(() {});
                  },
                ),
              );
            }),
          ),
        ),
        Expanded(child: tapBar[selectedItem].widget),
      ],
    );
  }
}
