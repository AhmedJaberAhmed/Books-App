part of 'similar_cubit.dart';

@immutable
sealed class SimilarState {}

final class SimilarInitial extends SimilarState {}
final class SimilarSuccess extends SimilarState {
   final List<BookModel> books;

  SimilarSuccess(this.books);
}
final class SimilarFaluire extends SimilarState {
  final String errMessage;

  SimilarFaluire( this.errMessage);
}
final class SimilarLoading extends SimilarState {}
