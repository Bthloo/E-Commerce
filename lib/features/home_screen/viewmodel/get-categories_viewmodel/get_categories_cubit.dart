
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api_manager/api_manager.dart';
import '../../../../core/models/CategoriesModel.dart';

part 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit() : super(GetCategoriesInitial());
  List<CategoryModel> categories = [];
  static GetCategoriesCubit get(context) => BlocProvider.of(context);
  getCategory() async {
    emit(GetCategoriesLoading());
   try {
      var response = await ApiManager.getCategories();
    for (var element in response) {
      categories.add(CategoryModel.fromJson(element));
    }
    emit(GetCategoriesSuccess(categories));
  } catch (ex) {
     emit(GetCategoriesError('$ex'));
  }
  }
}
