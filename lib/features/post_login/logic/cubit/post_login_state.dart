part of 'post_login_cubit.dart';

sealed class PostLoginState extends Equatable {
  const PostLoginState();

  @override
  List<Object> get props => [];
}

final class PostLoginInitial extends PostLoginState {}

final class GetUserTypeLoadingState extends PostLoginState {}

final class GetUserTypeSuccsses extends PostLoginState {
  final String userType;

  GetUserTypeSuccsses({required this.userType});
}

final class GetUserTypeError extends PostLoginState {
  final String error;

  GetUserTypeError({required this.error});
}
