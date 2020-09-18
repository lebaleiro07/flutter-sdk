import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

import 'upload_service_impl.dart';

abstract class UploadService {
  upload(MultipartFile multipart,  {
    @required OnUploadProgressCallback onProgressCallback,
    OnCompleteUpload onComplete,
    OnErrorCallback onError
  });
}