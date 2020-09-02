import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:music_playce_sdk/core/api/environment/environment.dart';
import 'package:music_playce_sdk/core/api/services/upload_service/upload_service.dart';
import 'package:music_playce_sdk/core/http/music_playce_http_headers.dart';

typedef void OnUploadProgressCallback(int sentBytes, int totalBytes);


class UploadServiceImpl implements UploadService {
  upload(MultipartFile multipart,  {
    @required OnUploadProgressCallback onProgressCallback
  }) async {
    final header = GetIt.I<MusicPlayceHttpHeaders>()
      .headers;

    final client = HttpClient()..connectionTimeout = const Duration(seconds: 10);

    final url = "${GetIt.I<Environment>().get(EnvironmentKeys.apiHost)}/v1/media";

    final request = await client.postUrl(Uri.parse(url));

    int bytesCount = 0;

    final multipartRequest = MultipartRequest("POST", Uri.parse(url));

    multipartRequest.files.add(multipart);

    final stream = multipartRequest.finalize();

    final totalByteLength = multipartRequest.contentLength;

    request.contentLength = totalByteLength;

    request.headers.add(HttpHeaders.contentTypeHeader,
        multipartRequest.headers[HttpHeaders.contentTypeHeader]);

    for (String item in header.keys) request.headers.add(item, header[item]);

    Stream<List<int>> streamUpload = stream.transform(
      new StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(data);

          bytesCount += data.length;

          if (onProgressCallback != null) {
            onProgressCallback(bytesCount, totalByteLength);
            // CALL STATUS CALLBACK;
          }
        },
        handleError: (error, stack, sink) {
          throw error;
        },
        handleDone: (sink) {
          sink.close();
          // UPLOAD DONE;
        },
      ),
    );

    await request.addStream(streamUpload);

    final httpResponse = await request.close();

    var statusCode = httpResponse.statusCode;

    if (statusCode ~/ 100 != 2) {
      Map<String, dynamic> respMap = {'status': httpResponse.statusCode};

      return respMap;
    } else {
      try {
        final mediaId = json
            .decode(await _readResponseAsString(httpResponse))['data']['_id']
            .toString();
        Map<String, dynamic> respMap = {'id': mediaId, 'status': 200};
        
        return respMap;
      } catch (e) {
        print("Exception trows on MediaService.fileUploadMultipart: $e");
        
        Map<String, dynamic> respMap = {'status': -1};

        return respMap;
      }
    }
  }

  Future<String> _readResponseAsString(HttpClientResponse response) {
    var completer = new Completer<String>();
    var contents = new StringBuffer();
    response.transform(utf8.decoder).listen((String data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }
}