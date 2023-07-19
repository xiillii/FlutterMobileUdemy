import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

import '../../domain/repositories/video_posts_repository.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository repository;

  bool initialLoading = true;
  List<VideoPost> videos = [];

  DiscoverProvider({required this.repository});

  Future<void> loadNextPage() async {
    final newVideos = await repository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);

    initialLoading = false;

    notifyListeners();
  }
}
