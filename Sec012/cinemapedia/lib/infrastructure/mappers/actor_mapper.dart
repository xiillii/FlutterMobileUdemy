import 'package:cinemapedia/config/constants/general.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? '${GeneralConstants.movieDbImagePath}${cast.profilePath}'
          : GeneralConstants.noActorPicture,
      character: cast.character);
}
