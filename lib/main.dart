import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_care_app/constant.dart';
import 'smart_care.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();
  final sharedPref = await SharedPreferences.getInstance();
  token = sharedPref.getString('token') ?? '';
  runApp(const SmartCare());
}
