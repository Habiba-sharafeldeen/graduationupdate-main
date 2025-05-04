import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final Dio dio;

  ApiService(this.dio);
  Future<Map<String, dynamic>> post({required endpoint,required data})async{
    var response= await dio.post('http://ma7aliapigp.runasp.net/api/Account/Login$endpoint',
    data: data,
    options: Options(
      headers: {

      }
    )
    );
    return response.data;
    
  }
}
