import 'dart:typed_data';

import 'package:music_playce_sdk/core/api/models/posts/posts.model.dart';
import 'package:share_api/composers/story_composer.dart';

abstract class ShareService {
  share(Post post, ShareTarget target, {
    String context = 'feed', Uint8List byteList
  });
  Future<bool> fromFacebook(StoryComposer composer);
  Future<bool> fromInstagram(StoryComposer composer);
  Future<bool> fromText(StoryComposer composer);
}

enum ShareTarget {
  TEXT,
  FACEBOOK,
  INSTAGRAM
}

extension StringParsre on ShareTarget {
  String get asString {
    switch (this) {
      case ShareTarget.TEXT:
        return 'TEXT';
      case ShareTarget.FACEBOOK:
        return 'FACEBOOK';
      case ShareTarget.INSTAGRAM:
        return 'INSTAGRAM';
      default:
        return null;
    }
  }
}