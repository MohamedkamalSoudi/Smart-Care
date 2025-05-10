import 'package:flutter/material.dart';
import '../../../../../../core/utils/app_colors.dart';
import 'connection_status_indicator.dart';
import 'connection_status_content.dart';
import 'connection_status_actions.dart';

class ConnectionStatusCard extends StatelessWidget {
  final String timestamp;
  final String date;
  final String connectionType;
  final String message;
  final bool isToggled;
  final VoidCallback onToggle;

  const ConnectionStatusCard({
    super.key,
    required this.timestamp,
    required this.date,
    required this.connectionType,
    required this.message,
    required this.isToggled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildCard(context),
        Divider(
          color: AppColors.grey200,
          thickness: 0.5,
          indent: 50,
          endIndent: 50,
        ),
      ],
    );
  }

  Widget _buildCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: Container(
        height: 130,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColors.whitebody,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.15),
              offset: const Offset(4, 4),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: Color.fromARGB(255, 95, 95, 95).withOpacity(0.15),
              offset: const Offset(-1, -1),
              blurRadius: 0,
              spreadRadius: 0,
            ),
          ],
        ),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ConnectionStatusIndicator(isToggled: isToggled),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 16, right: 20, bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: ConnectionStatusContent(
                        connectionType: connectionType,
                        message: message,
                        timestamp: timestamp,
                        date: date),
                    ),
                    ConnectionStatusActions(
                      isToggled: isToggled,
                      onToggle: onToggle,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}