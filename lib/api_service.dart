import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Map<String, dynamic>> postData({
    required String endpoint,
    required Map<String, dynamic> data,
  }) async {
    try {
      final response = await dio.post(
        'http://ma7aliapigp.runasp.net/api/Account/$endpoint',
        data: data,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      print('API RESPONSE (${response.statusCode}): ${response.data}');
      return response.data;
    } catch (e) {
      print('API ERROR: $e');
      rethrow;
    }
  }
}