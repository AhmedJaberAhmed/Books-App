import 'package:bookly/Core/errors/failures.dart';
import 'package:bookly/Features/Home/data/Repository/home_repo.dart';
import 'package:bookly/Features/Home/data/model/bookModel.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../Core/utils/api_service.dart';

class HomeRepoImplementation implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementation(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewsBooks() async {
    try  {
      var data = await apiService.get(
          "volumes?Filtering=free-ebooks&q=computer science");

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(e.toString()));
      }
      return left (ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeatureBooks() async {
    try {
      var data = await apiService.get(
          "volumes?Filtering=free-ebooks&Sorting=newest&q=subject:Programming");

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(e.toString()));
      }
      return left (ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category})async {
    try {
      var data = await apiService.get(
          "volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:Programming");

      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure(e.toString()));
      }
      return left (ServerFailure(e.toString()));
    }
  }


}
