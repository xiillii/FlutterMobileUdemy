import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cinemapedia/config/helpers/human_formats.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/widgets/shared/image_url_error.dart';
import 'package:flutter/material.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;
  List<Movie> initialMovies;
  StreamController<List<Movie>> debounceMovies = StreamController.broadcast();
  StreamController<bool> isLoadingStream = StreamController.broadcast();
  Timer? _debouncedTimer;

  SearchMovieDelegate(
      {required this.searchMovies, required this.initialMovies});

  void clearStreams() => debounceMovies.close();

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);
    if (_debouncedTimer?.isActive ?? false) _debouncedTimer!.cancel();

    _debouncedTimer = Timer(const Duration(milliseconds: 500), () async {
      final movies = await searchMovies(query);
      initialMovies = movies;
      debounceMovies.add(movies);
      isLoadingStream.add(false);
    });
  }

  @override
  String get searchFieldLabel => 'Search movie';

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
          initialData: false,
          stream: isLoadingStream.stream,
          builder: (context, snapshot) {
            if (snapshot.data ?? false) {
              return SpinPerfect(
                duration: const Duration(seconds: 20),
                spins: 10,
                infinite: true,
                animate: query.isNotEmpty,
                child: IconButton(
                    onPressed: () => query = '',
                    icon: const Icon(Icons.refresh_rounded)),
              );
            }
            return FadeIn(
                animate: query.isNotEmpty,
                child: IconButton(
                  onPressed: () => query = '',
                  icon: const Icon(Icons.clear_outlined),
                ));
          }),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          clearStreams();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildResultsAndSuggestions();
  }

  Widget buildResultsAndSuggestions() {
    return StreamBuilder(
        initialData: initialMovies,
        stream: debounceMovies.stream,
        builder: (context, snapshot) {
          final movies = snapshot.data ?? [];

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return _MovieItem(
                movie: movie,
                onMovieSelected: (context, movie) {
                  clearStreams();
                  close(context, movie);
                },
              );
            },
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _onQueryChanged(query);
    return buildResultsAndSuggestions();
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(children: [
          //image
          SizedBox(
            width: size.width * 0.2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                movie.posterPath,
                loadingBuilder: (context, child, loadingProgress) =>
                    FadeIn(child: child),
                errorBuilder: (context, error, stackTrace) =>
                    const ImageUrlError(),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),

          // description
          SizedBox(
            width: size.width * 0.7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movie.title,
                  style: textStyles.titleMedium,
                ),
                movie.overview.length > 100
                    ? Text('${movie.overview.substring(0, 99)}...')
                    : Text(movie.overview),
                Row(
                  children: [
                    Icon(
                      Icons.star_half_rounded,
                      color: Colors.yellow.shade800,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      HumanFormats.numberCompact(movie.voteAverage, 1),
                      style: textStyles.bodyMedium!
                          .copyWith(color: Colors.yellow.shade900),
                    ),
                  ],
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
