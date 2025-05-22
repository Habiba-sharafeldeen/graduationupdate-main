import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<Map<String, dynamic>?> fetchUserProfile() async {
  final prefs = await SharedPreferences.getInstance();
  final token = prefs.getString('token');

  if (token == null) return null;

  final response = await http.get(
    Uri.parse('http://ma7aliapigrad.runasp.net/api/Auth/profile'),
    headers: {
      'accept': 'text/plain',
      'Authorization': 'Bearer $token',
    },
  );

  if (response.statusCode == 200) {
    return jsonDecode(response.body);
  } else {
    print('Failed to load profile: ${response.statusCode}');
    return null;
  }
}