import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class JsonPlaceHolderCustonDio {
  final _dio = Dio();

  Dio get dio => _dio;
  JsonPlaceHolderCustonDio() {
    //JSONPLACEHOLDERURL=https://jsonplaceholder.typicode.com
    var url = dotenv.get('JSONPLACEHOLDERURL', fallback: 'sane-default');
    _dio.options.baseUrl = url;
  }
}
