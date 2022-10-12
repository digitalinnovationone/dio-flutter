import 'package:dio/dio.dart';

class JsonPlaceHolderCustonDio {
  final _dio = Dio();

  Dio get dio => _dio;
  JsonPlaceHolderCustonDio() {
    _dio.options.baseUrl = "https://jsonplaceholder.typicode.com";
  }
}
