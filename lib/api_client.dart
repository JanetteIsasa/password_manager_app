import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();

  Future<dynamic> registerUser(Map<String, dynamic>? data) async {
    try {
      Response response = await _dio.post(
          'http://10.0.2.2:8000/api/v1/auth/signup',
          data: data,);
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

  Future<dynamic> login(String username, String password) async {
    try {
      Response response = await _dio.post(
        'http://10.0.2.2:8000/api/v1/auth/login',
        data: {
          'username': username,
          'password': password
        },
          options: Options(contentType: Headers.formUrlEncodedContentType)
      );
      return response.data;
    } on DioError catch (e) {
      return e.response!.data;
    }
  }

}