import 'package:cinemapedia/domain/entities/movie.dart';

abstract class StorageRepository {
  Future<void> toggleFavorite(Movie movie);
  Future<bool> isMovieFavorite(int id);
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0});
}
