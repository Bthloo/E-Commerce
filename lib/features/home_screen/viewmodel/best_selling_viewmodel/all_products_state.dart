part of 'all_products_cubit.dart';

@immutable
sealed class AllProductsState {}

final class AllProductsInitial extends AllProductsState {}
final class AllProductsLoading extends AllProductsState {}
final class AllProductsLoaded extends AllProductsState {
  final List<Products> products;

  AllProductsLoaded(this.products);
}
final class AllProductsError extends AllProductsState {
  final String message;

  AllProductsError(this.message);
}
