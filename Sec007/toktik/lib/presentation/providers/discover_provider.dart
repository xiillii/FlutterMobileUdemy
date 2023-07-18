import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];

  Future<void> loadNextPage() async {
    // TODO carfar videos

    notifyListeners();
  }
}
