import 'package:b_commerce/core/models/products_from_category_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api_manager/api_manager.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
  void search(String query) async {
    emit(SearchLoading());
    try {
      var request = await ApiManager.searchProducts(query: query);
      emit(SearchSuccess(request.products??[]));
    }on DioException catch (e) {
      emit(SearchFailure(e.response?.data['message'] ?? e.message));
    } catch (e) {
      emit(SearchFailure(e.toString()));
    }
  }

}
