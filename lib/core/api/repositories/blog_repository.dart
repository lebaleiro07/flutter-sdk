import 'package:http/http.dart';
import 'package:music_playce_sdk/core/api/endpoints/blog_endpoint.dart';
import 'package:music_playce_sdk/core/api/models/blog/articles_response.dart';
import '../endpoints/blog_endpoint.dart';

/// The abstract class for BlogRepository
///
/// The subclasses need to implement his methods
/// in order to communicate with the blog endpoints
abstract class BlogRepository {
  /// Sends an HTTP request to the blog endpoint in order to
  /// fetch all articles
  /// 
  /// The request is made to [BlogEndpoint.getAllArticles]
  /// 
  /// It returns a [List] of [ArticlesResponse]
  /// objects
  Future<List<ArticlesResponse>> getAllArticles();

}
