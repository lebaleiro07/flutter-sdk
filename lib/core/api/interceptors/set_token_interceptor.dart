import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';

import '../../http/music_playce_http_headers.dart';
import '../../http/music_playce_http_interceptor_wrapper.dart';
import '../../utils/string_util.dart';
import '../endpoints/v3/auth_endpoint.dart';
import '../models/auth/signin_response.model.dart';

/// Interceptor thas sets the headers when the user
/// logs in
///
/// It returns a [Response] that contains the headers
class SetTokenInterceptor implements MusicPlayceHttpInterceptorWrapper {
  @override
  Future<Response> interceptResponse(Response response, body) async {
    final mpHeaders = GetIt.instance<MusicPlayceHttpHeaders>();

    if (response.statusCode == 200 &&
        _allowedRoutes.contains(response.request.url)) {
      final signinResponse =
          SignInResponse.fromJson(json.decode(response.body)['jwt']);

      mpHeaders.authorizationHeader = signinResponse.token;
    }

    return response;
  }

  List<Uri> _allowedRoutes = [
    AuthEndpoint.signin.toURI(),
    AuthEndpoint.signup.toURI()
  ];
}
