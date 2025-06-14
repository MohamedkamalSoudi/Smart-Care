String convertTo24HourFormat(String time12h) {
  final format = RegExp(r'(\d+):(\d+)\s*(AM|PM)', caseSensitive: false);
  final match = format.firstMatch(time12h.trim());

  if (match == null) return "00:00"; // fallback

  int hour = int.parse(match.group(1)!);
  final int minute = int.parse(match.group(2)!);
  final String period = match.group(3)!.toUpperCase();

  if (period == 'PM' && hour != 12) hour += 12;
  if (period == 'AM' && hour == 12) hour = 0;

  return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
}
