import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorage {
  Future<void> saveUsersLocally(List<Map<String, dynamic>> users) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('users', json.encode(users));
  }

  Future<List<Map<String, dynamic>>> getLocalUsers() async {
    final prefs = await SharedPreferences.getInstance();
    final usersJson = prefs.getString('users');
    if (usersJson != null) {
      return List<Map<String, dynamic>>.from(json.decode(usersJson));
    } else {
      return [];
    }
  }
}
