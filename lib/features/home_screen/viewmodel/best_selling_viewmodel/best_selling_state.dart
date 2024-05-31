part of 'best_selling_cubit.dart';

@immutable
sealed class BestSellingState {}

final class BestSellingInitial extends BestSellingState {}
final class BestSellingLoading extends BestSellingState {}
final class BestSellingLoaded extends BestSellingState {
  final List<ProductItemModel> products;

  BestSellingLoaded(this.products);
}
final class BestSellingError extends BestSellingState {
  final String message;

  BestSellingError(this.message);
}
