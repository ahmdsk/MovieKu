import 'package:movieku/model/movie_model.dart';
import 'package:movieku/services/movie_services.dart';

class MovieController {
  List<Movie> popularMovies = [];
  Movie? selectedMovie;
  bool isLoading = false;
  String? error;

  // Ambil daftar movie populer
  Future<void> fetchPopularMovies({ int page = 1}) async {
    try {
      isLoading = true;
      error = null;

      final movies = await MovieService.getPopularMovies(page: page);
      popularMovies = movies;
    } catch (e) {
      error = 'Gagal memuat daftar film';
    } finally {
      isLoading = false;
    }
  }

  // Ambil detail movie berdasarkan ID
  Future<void> fetchMovieById(int id) async {
    try {
      isLoading = true;
      error = null;

      final movie = await MovieService.getMovieById(id);
      selectedMovie = movie;
    } catch (e) {
      error = 'Gagal memuat detail film';
    } finally {
      isLoading = false;
    }
  }
}
