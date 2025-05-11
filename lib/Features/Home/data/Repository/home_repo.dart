import 'package:dartz/dartz.dart';

import '../../../../Core/errors/failures.dart';
import '../model/bookModel.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks();

  Future<Either<Failure,List<BookModel>>> fetchFeatureBooks();
  Future<Either<Failure,List<BookModel>>> fetchSimilarBooks({required String category});

}
