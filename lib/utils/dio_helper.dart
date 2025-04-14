import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static const String baseUrl = 'https://api.themoviedb.org/3/';
  static const String apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIxZjI4MzQ1NWFlNDNmOGE0MGQ0NjA3MjlkYjQ4MDQ5NiIsIm5iZiI6MTYyMjYyMTU2MS44MjMsInN1YiI6IjYwYjczZDc5ODk5ZGEyMDA2ZjA5M2NmNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.N_2TAZhO5L2s7UnZ1nIQFU1AAHvhJf9tC4NkFrjyA3w'; // Ganti dengan API Key kamu

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        queryParameters: {
          'language': 'en-US', // bisa disesuaikan
        },
        headers: {
          'Content-Type': 'application/json',
          'accept': 'application/json',
          'Authorization': 'Bearer $apiKey'
        },
      ),
    );
  }

  static Future<Response> getData({
    required String path,
    Map<String, dynamic>? query,
  }) async {
    return await dio.get(path, queryParameters: query);
  }
}
