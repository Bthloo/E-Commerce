import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api_manager/api_manager.dart';
import '../../../../core/models/AllCategoriesModel.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit() : super(GetCategoriesInitial());
  static GetCategoriesCubit get(context) => BlocProvider.of(context);
  getCategory() async {
    emit(GetCategoriesLoading());
    try {
      var response = await ApiManager.getAllCategories();
      if (response.success!) {
        emit(GetCategoriesSuccess(response.data?.categories??[]));
      } else {
        emit(GetCategoriesError(response.message!));
      }
    } catch (ex) {
      emit(GetCategoriesError('$ex'));
    }
  }
}
