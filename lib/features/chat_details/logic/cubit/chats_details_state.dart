part of 'chats_details_cubit.dart';

sealed class ChatsDetailsState extends Equatable {
  const ChatsDetailsState();

  @override
  List<Object> get props => [];
}

final class ChatsDetailsInitial extends ChatsDetailsState {}

final class GetMessagesLoadingState extends ChatsDetailsState {}

final class GetMessagesSuccsses extends ChatsDetailsState {
  final List<MessageModel> messages;
  const GetMessagesSuccsses({required this.messages});
}

final class GetMessagesError extends ChatsDetailsState {
  final String error;
  const GetMessagesError({required this.error});
}

final class AddNewMessages extends ChatsDetailsState {}
