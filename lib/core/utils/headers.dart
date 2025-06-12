import 'package:shared_preferences/shared_preferences.dart';

class HeadersApi {
  static const String contentType = 'application/json';
  static const String accept = 'application/json';
  static const String cookie = '__test=65172b53e0ba00036a3fefc18540c457';
  static const String userAgent =
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/137.0.0.0 Safari/537.36';

  static Future<Map<String, String>> getHeaders() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString("token") ?? "";

    return {
      'Accept': accept,
      'cookie': cookie,
      'user-agent': userAgent,
      'Authorization': 'Bearer $token',
    };
  }
}
