import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(topRatedMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);

    return CustomScrollView(slivers: [
      const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(),
        title: CustomAppbar(),
      ),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return Column(children: [
          MoviesSlideshow(movies: slideShowMovies),
          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'In Theaters',
            subtitle: 'Today',
            loadNextPage: () {
              ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListview(
            movies: popularMovies,
            title: 'Populars',
            // subtitle: 'Today',
            loadNextPage: () {
              ref.read(popularMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListview(
            movies: topRatedMovies,
            title: 'Top Rated',
            subtitle: 'Since ever',
            loadNextPage: () {
              ref.read(topRatedMoviesProvider.notifier).loadNextPage();
            },
          ),
          MovieHorizontalListview(
            movies: upcomingMovies,
            title: 'Upcoming',
            subtitle: 'This month',
            loadNextPage: () {
              ref.read(upcomingMoviesProvider.notifier).loadNextPage();
            },
          ),
          const SizedBox(
            height: 10,
          )
        ]);
      }, childCount: 1))
    ]);
  }
}
