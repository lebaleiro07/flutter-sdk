import 'package:dartz/dartz.dart';

abstract class SearchRepository {
  Future<Either<Exception, Map>> search(String query, {int limit = 5});
}
