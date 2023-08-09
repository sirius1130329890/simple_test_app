import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiProvider {
  Future<List<Map<String, dynamic>>> getUsersFromApi() async {
    final response =
    await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['data']);
    } else {
      throw Exception('Failed to load users');
    }
  }

  Future<Map<String, dynamic>> getUserDetailsFromApi(int userId) async {
    final response = await http
        .get(Uri.parse('https://reqres.in/api/users/$userId'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return data['data'];
    } else {
      throw Exception('Failed to load user details');
    }
  }
}
