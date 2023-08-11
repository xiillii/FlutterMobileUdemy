import 'package:cinemapedia/config/constants/general.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDb movie) => Movie(
      adult: movie.adult,
      backdropPath: movie.backdropPath != ''
          ? '${General.movieDbImagePath}${movie.backdropPath}'
          : General.movieDbImagePath,
      genreIds: movie.genreIds.map((e) => e.toString()).toList(),
      id: movie.id,
      originalLanguage: movie.originalLanguage,
      originalTitle: movie.originalTitle,
      overview: movie.overview,
      popularity: movie.popularity,
      posterPath: movie.posterPath != ''
          ? '${General.movieDbImagePath}${movie.posterPath}'
          : General.movieDbImagePath,
      releaseDate: movie.releaseDate,
      title: movie.title,
      video: movie.video,
      voteAverage: movie.voteAverage,
      voteCount: movie.voteCount);
}
