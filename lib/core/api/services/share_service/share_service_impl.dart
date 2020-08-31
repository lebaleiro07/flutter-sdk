import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:music_playce_sdk/core/api/models/posts/posts.model.dart';
import 'package:music_playce_sdk/core/api/services/share_service/share_service.dart';
import 'package:share_api/composers/story_composer.dart';
import 'package:share_api/share_api.dart';


class ShareServiceImpl implements ShareService {
  @override
  Future<bool> share(Post post, ShareTarget target, {
    String context = 'feed', Uint8List byteList,
    fallbackSong = ''
  }) async {
    final moment = '';
    if (target == ShareTarget.FACEBOOK || target == ShareTarget.INSTAGRAM) {
      Uint8List sticker =
          byteList ?? await _bytesFromAsset(fallbackSong);
      StoryComposer composer = StoryComposer(
        stickerAsset: sticker,
        stickerMediaType: 'image/png',
        bottomBackgroundColor: Color(0xff0E0201),
        topBackgroundColor: Color(0xffd51504),
      );

      if (target == ShareTarget.FACEBOOK) {
        return fromFacebook(composer);
      } else if (target == ShareTarget.INSTAGRAM) {
        return fromInstagram(composer);
      }
    }
  }

  Future<Uint8List> _bytesFromAsset(String asset) async {
    return (await rootBundle.load(asset)).buffer.asUint8List();
  }

  @override
  Future<bool> fromFacebook(StoryComposer composer) async {
    try {
      final response = await ShareApi.viaFacebook.shareToStory(composer);

      return response != 3;
    } catch(e) {
      return false;
    }
  }
  
  @override
  Future<bool> fromInstagram(StoryComposer composer) async {
    try {
      final response = await ShareApi.viaInstagram.shareToStory(composer);

      return response != 3;
    } catch(e) {
      return false;
    }
  }
  
  @override
  Future<bool> fromText(StoryComposer composer) {
    // TODO: implement fromText
    throw UnimplementedError();
  } 
}