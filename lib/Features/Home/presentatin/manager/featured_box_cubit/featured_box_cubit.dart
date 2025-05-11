import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/Repository/home_repo.dart';
import '../../../data/model/bookModel.dart';

part 'featured_box_state.dart';

class FeaturedBoxCubit extends Cubit<FeaturedBoxState> {
  FeaturedBoxCubit(this.homeRepo) : super(FeaturedBoxInitial());
  final HomeRepo homeRepo;

  Future<void> fetchFeaturedBox()async {
    emit(FeaturedBoxLoading());
    var result=await  homeRepo.fetchFeatureBooks();
    result.fold((Faluire){
      emit(FeaturedBoxFaluire(Faluire.message));


    },(books){
      emit(FeaturedBoxSuccess(books));


    });
  }
}
