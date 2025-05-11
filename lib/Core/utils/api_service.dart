import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://www.googleapis.com/books/v1/";
  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get(String endPoint) async {
    var response = await _dio.get("$_baseUrl$endPoint");
    return response.data;
    //The method returns response.data, which contains the API's JSON response parsed into a Dart map.
  }
}
