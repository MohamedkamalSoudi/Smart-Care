enum ConnectionStatus { success, warning }

class ConnectionStatusData {
  final String timestamp;
  final String date;
  final String connectionType;
  final ConnectionStatus status;
  final String message;
  final bool isToggled;

  ConnectionStatusData({
    required this.timestamp,
    required this.date,
    required this.connectionType,
    required this.status,
    required this.message,
    required this.isToggled,
  });
}