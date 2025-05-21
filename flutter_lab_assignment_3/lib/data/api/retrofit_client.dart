import 'package:dio/dio.dart';

class RetrofitClient {
  final Dio dio = Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));
}
