import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/Repository/home_repo.dart';
import '../../../data/model/bookModel.dart';

part 'similar_state.dart';

class SimilarCubit extends Cubit<SimilarState> {
  SimilarCubit(this.homeRepo) : super(SimilarInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimilarBox({required String category})async {
    emit(SimilarLoading());
    var result=await  homeRepo.fetchSimilarBooks(category: category);
    result.fold((faluire){
      emit(SimilarFaluire(faluire.message));


    },(books){
      emit(SimilarSuccess(books));


    });
  }

}
