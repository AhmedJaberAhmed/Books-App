part of 'featured_box_cubit.dart';

@immutable
sealed class FeaturedBoxState {}

final class FeaturedBoxInitial extends FeaturedBoxState {}

final class FeaturedBoxLoading extends FeaturedBoxState {}

final class FeaturedBoxSuccess extends FeaturedBoxState {
  final List<BookModel> books;

  FeaturedBoxSuccess(this.books);
}

final class FeaturedBoxFaluire extends FeaturedBoxState {
  final String errMessage;

  FeaturedBoxFaluire(this.errMessage);
}
