import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/storage_repository.dart';
import 'package:cinemapedia/presentation/providers/storage/local_storage_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoriteMoviesProvider =
    StateNotifierProvider<StorageMovieNotifier, Map<int, Movie>>((ref) {
  final repository = ref.watch(localStorageRepositoryProvider);

  return StorageMovieNotifier(repository: repository);
});

class StorageMovieNotifier extends StateNotifier<Map<int, Movie>> {
  int page = 0;
  final StorageRepository repository;

  StorageMovieNotifier({required this.repository}) : super({});

  Future<List<Movie>> loadNextPage() async {
    final movies = await repository.loadMovies(offset: page * 10, limit: 20);
    page++;

    final map = {for (var v in movies) v.id: v};
    state = {...state, ...map};
    return movies;
  }

  Future<void> toggleFavorite(Movie movie) async {
    await repository.toggleFavorite(movie);

    final bool isMovieInFavorites = await repository.isMovieFavorite(movie.id);

    if (!isMovieInFavorites) {
      state.remove(movie.id);
      state = {...state};
    } else {
      state = {...state, movie.id: movie};
    }
  }
}
