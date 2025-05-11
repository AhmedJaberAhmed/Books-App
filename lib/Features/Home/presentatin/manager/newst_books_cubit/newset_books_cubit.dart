import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/Repository/home_repo.dart';
import '../../../data/model/bookModel.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState>  {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchNewstBox() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fetchNewsBooks();
    result.fold(
            (faluire) {
      emit(NewsetBooksFaluire(faluire.message));
         }
    , (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
