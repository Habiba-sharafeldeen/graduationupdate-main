import 'package:dio/dio.dart';

class ProfileRepo {
  final Dio dio;

  ProfileRepo({required this.dio});

  Future<Map<String, dynamic>> fetchProfile(String token) async {
    try {
      final response = await dio.get(
        'https://yourapi.com/profile',
        options: Options(
          headers: {'Authorization': 'Bearer $token'},
        ),
      );
      if (response.statusCode == 200) {
        return response.data; // افترض الرد بيكون JSON خارطة بيانات المستخدم
      } else {
        throw Exception('Failed to load profile');
      }
    } catch (e) {
      throw Exception('Error fetching profile: $e');
    }
  }
}