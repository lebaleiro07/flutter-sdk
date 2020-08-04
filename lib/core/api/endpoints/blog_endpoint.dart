import 'package:get_it/get_it.dart';
import 'package:music_playce_sdk/core/api/environment.dart';

class BlogEndpoint {
  static final _env = GetIt.instance<Environment>();
  //TODO verificar se eh v2 mesmo
  static String getAllArticles = "${_env.apiHost}/v1/blog/articles";

  static String getAllArticlesLikes = "${_env.apiHost}/v1/blog/articles/likes";

  static String getAllArticlesReads = "${_env.apiHost}/v1/blog/articles/reads";

  static String getAllArticlesComments =
      "${_env.apiHost}/v1/blog/articles/comments";

  static String getAllArticlesFeedbacks =
      "${_env.apiHost}/v1/blog/articles/feedbacks";

  static String addArticleLike = "${_env.apiHost}/v1/blog/articles/:id/likes";

  static String addArticleRead = "${_env.apiHost}/v1/blog/articles/:id/reads";

  static String getArticleReads = "${_env.apiHost}/v1/blog/articles/reads/:id";

  static String createArticleComment =
      "${_env.apiHost}/v1/blog/articles/:id/comments/";

  static String getArticleComment =
      "${_env.apiHost}/v1/blog/articles/comments/:id";

  static String updateArticleComment =
      "${_env.apiHost}/v1/blog/articles/comments/:id/";

  static String createArticleFeedback =
      "${_env.apiHost}/v1/blog/articles/:id/feedbacks";

  static String getArticleFeedback =
      "${_env.apiHost}/v1/blog/articles/feedbacks/:id";

  static String updateArticleFeedback =
      "${_env.apiHost}/v1/blog/articles/feedbacks/:id";

  static String createArticle = "${_env.apiHost}/v1/blog/articles";

  static String getArticlesByTag = "${_env.apiHost}/v1/blog/articles/:tag";

  static String getArticlesByCategory =
      "${_env.apiHost}/v1/blog/articles/category/:category/";

  static String getArticlesById = "${_env.apiHost}/v1/blog/articles/:id/";

  static String updateArticleById = "${_env.apiHost}/v1/blog/articles/:id/";

  static String getArticleLikesById =
      "${_env.apiHost}/v1/blog/articles/:id/likes";

  static String getArticleReadsById =
      "${_env.apiHost}/v1/blog/articles/:id/reads/";

  static String getArticleFeedbacksById =
      "${_env.apiHost}/v1/blog/articles/:id/feedbacks/";
}
