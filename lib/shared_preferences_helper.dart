import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesHelper {
  static const String _keyButtons = 'buttons';

  static Future<void> saveButtons(List<Map<String, dynamic>> buttons) async {
    final prefs = await SharedPreferences.getInstance();
    final String jsonString = jsonEncode(buttons);
    prefs.setString(_keyButtons, jsonString);
  }

  static Future<List<Map<String, dynamic>>> loadButtons() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jsonString = prefs.getString(_keyButtons);
    if (jsonString != null) {
      final List<dynamic> jsonList = jsonDecode(jsonString);
      return jsonList.map((item) => item as Map<String, dynamic>).toList();
    }
    return [];
  }
}
