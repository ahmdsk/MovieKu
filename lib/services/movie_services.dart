import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movieku/model/movie_model.dart';
import 'package:movieku/utils/dio_helper.dart';

class MovieService {
  // Get list of popular movies
  static Future<List<Movie>> getPopularMovies({int page = 1, String? query}) async {
    try {
      final Response response = await DioHelper.getData(
        path: 'movie/popular',
        query: {
          'query': query,
          'page': page
        },
      );

      // debugPrint('Hasil Response movie: $response');

      List results = response.data['results'];
      return results.map((json) => Movie.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Error fetching popular movies: $e');
      rethrow;
    }
  }

  // Get movie by ID
  static Future<Movie> getMovieById(int movieId) async {
    try {
      final Response response = await DioHelper.getData(path: 'movie/$movieId');
      // debugPrint('Hasil Response by id: $response');

      return Movie.fromJson(response.data);
    } catch (e) {
      debugPrint('Error fetching movie by ID: $e');
      rethrow;
    }
  }
}
