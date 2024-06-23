import 'package:b_commerce/core/models/products_from_category_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/api_manager/api_manager.dart';

part 'get_products_from_category_state.dart';

class GetProductsFromCategoryCubit extends Cubit<GetProductsFromCategoryState> {
  GetProductsFromCategoryCubit() : super(GetProductsFromCategoryInitial());

  static GetProductsFromCategoryCubit get(context) => BlocProvider.of(context);

  getProductsFromCategory({required num categoryId}) async {
    emit(GetProductsFromCategoryLoading());
    try {
      var response = await ApiManager.getProductsFromCategory(categoryId);
      if (response.success!) {
        emit(GetProductsFromCategorySuccess(response.data?.products ?? []));
      } else {
        emit(GetProductsFromCategoryError(response.message!));
      }
    } catch (ex) {
      emit(GetProductsFromCategoryError('$ex'));
    }
  }
}