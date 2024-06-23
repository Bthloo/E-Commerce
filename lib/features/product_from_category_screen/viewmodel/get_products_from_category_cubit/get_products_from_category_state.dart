part of 'get_products_from_category_cubit.dart';

@immutable
sealed class GetProductsFromCategoryState {}

final class GetProductsFromCategoryInitial extends GetProductsFromCategoryState {}
final class GetProductsFromCategoryLoading extends GetProductsFromCategoryState {}
final class GetProductsFromCategorySuccess extends GetProductsFromCategoryState {
  final List<Products> products;
  GetProductsFromCategorySuccess(this.products);
}
final class GetProductsFromCategoryError extends GetProductsFromCategoryState {
  final String message;
  GetProductsFromCategoryError(this.message);
}
