import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://reqres.in/api';

  static Future<List<String>> fetchEmployeeNames() async {
    final response = await http.get(Uri.parse('$baseUrl/users?page=2'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<dynamic> usersData = jsonData['data'];
      return usersData.map<String>((userJson) {
        return '${userJson['first_name']} ${userJson['last_name']}';
      }).toList();
    } else {
      throw Exception('Failed to fetch employee names');
    }
  }
}
