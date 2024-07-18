part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}
final class ProfileLoading extends ProfileState {}
final class ProfileSuccess extends ProfileState {
  final ProfileResponseModel profileResponseModel;
  ProfileSuccess(this.profileResponseModel);
}
final class ProfileError extends ProfileState{
  final String message;
  ProfileError(this.message);
}
