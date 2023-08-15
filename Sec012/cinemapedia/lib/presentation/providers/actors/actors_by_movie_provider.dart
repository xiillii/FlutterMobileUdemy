import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsByMovieProvider =
    StateNotifierProvider<ActorsByMovieNotifier, Map<String, List<Actor>>>(
        (ref) {
  final fetchActorsMovieById =
      ref.watch(actorsRepositoryProvider).getActorsByMovie;

  return ActorsByMovieNotifier(getActors: fetchActorsMovieById);
});

typedef GetActorsCallback = Future<List<Actor>> Function(String moveId);

class ActorsByMovieNotifier extends StateNotifier<Map<String, List<Actor>>> {
  final GetActorsCallback getActors;

  ActorsByMovieNotifier({required this.getActors}) : super({});

  Future<void> loadActors(String movieId) async {
    if (state[movieId] != null) return;

    final actors = await getActors(movieId);

    state = {...state, movieId: actors};
  }
}
