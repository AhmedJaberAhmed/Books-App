part of 'newset_books_cubit.dart';

@immutable
abstract class NewsetBooksState {}

final class NewsetBooksInitial extends NewsetBooksState {}

final class NewsetBooksLoading extends NewsetBooksState {}

final class NewsetBooksSuccess extends NewsetBooksState {
  final List<BookModel> books;

  NewsetBooksSuccess(this.books);
}

final class NewsetBooksFaluire extends NewsetBooksState {
  final String errMessage;

  NewsetBooksFaluire(this.errMessage);
}
