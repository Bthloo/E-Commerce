part of 'get_cart_cubit.dart';

@immutable
sealed class GetCartState {}

final class GetCartInitial extends GetCartState {}
final class GetCartLoading extends GetCartState {}
final class GetCartSuccess extends GetCartState {
  final List<Carts> cart;
  GetCartSuccess(this.cart);
}
final class GetCartError extends GetCartState {
  final String message;
  GetCartError(this.message);
}
