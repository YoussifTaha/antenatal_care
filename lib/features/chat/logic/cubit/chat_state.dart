part of 'chat_cubit.dart';

sealed class ChatState extends Equatable {
  const ChatState();

  @override
  List<Object> get props => [];
}

final class ChatInitial extends ChatState {}

final class GetChatsLoadingState extends ChatState {}

final class GetChatsSuccsses extends ChatState {
  final List<UserModel> patients;
  const GetChatsSuccsses({required this.patients});
}

final class GetChatsError extends ChatState {
  final String error;
  const GetChatsError({required this.error});
}
