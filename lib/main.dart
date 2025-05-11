import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'smart_care.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  runApp(const SmartCare());
}
