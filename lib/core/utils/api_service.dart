import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class ApiService {
  final _baseUrl = 'https://www.googleapis.com/books/v1/';

  final Dio _dio;

  ApiService(this._dio);

  Future<Map<String, dynamic>> get({required String endPoints}) async {
    _dio.interceptors.add(PrettyDioLogger());
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    var response = await _dio.get('$_baseUrl$endPoints');

    return response.data;
  }
}
