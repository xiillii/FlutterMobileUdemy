import 'package:cinemapedia/domain/datasources/storage_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/storage_repository.dart';

class LocalStorageRepositoryImpl extends StorageRepository {
  final StorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isMovieFavorite(int movieId) =>
      datasource.isMovieFavorite(movieId);

  @override
  Future<List<Movie>> loadMovies({int limit = 10, int offset = 0}) =>
      datasource.loadMovies(limit: limit, offset: offset);

  @override
  Future<void> toggleFavorite(Movie movie) => datasource.toggleFavorite(movie);
}
