import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final similarMoviesProvider =
    StateNotifierProvider<SimilarMoviesMapNotifier, Map<String, List<Movie>>>(
        (ref) {
  final fetchSimilarMoviesById =
      ref.watch(movieRepositoryProvider).getSimilarMoviesById;

  return SimilarMoviesMapNotifier(getSimilarMovies: fetchSimilarMoviesById);
});

typedef GetSimilarMovieCallback = Future<List<Movie>> Function(String moveId,
    {int page});

class SimilarMoviesMapNotifier extends StateNotifier<Map<String, List<Movie>>> {
  int currentPage = 0;
  bool isLoading = false;
  final GetSimilarMovieCallback getSimilarMovies;

  SimilarMoviesMapNotifier({required this.getSimilarMovies}) : super({});

  Future<void> loadSimilarMovies(String movieId) async {
    if (isLoading) return;
    isLoading = true;
    currentPage++;
    if (state[movieId] != null) {
      isLoading = false;
      return;
    }

    final movie = await getSimilarMovies(movieId, page: currentPage);

    state = {...state, movieId: movie};
    isLoading = false;
  }
}
