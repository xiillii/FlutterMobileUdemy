import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/share/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, DataSource
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    await Future.delayed(const Duration(seconds: 2));

    final List<VideoPost> newVideos = videoPosts
        .map((item) => LocalVideoModel.fromJson(item).toVideoPostEntity())
        .toList();

    videos.addAll(newVideos);

    notifyListeners();
  }
}
