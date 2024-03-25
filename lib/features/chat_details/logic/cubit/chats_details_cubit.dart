import 'package:antenatal_app/features/chat_details/data/models/message_model.dart';
import 'package:antenatal_app/features/chat_details/data/repos/chat_details_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'chats_details_state.dart';

class ChatsDetailsCubit extends Cubit<ChatsDetailsState> {
  ChatsDetailsCubit(this.chatDetailsRepo) : super(ChatsDetailsInitial());

  final ChatDetailsRepo chatDetailsRepo;

  static ChatsDetailsCubit get(context) => BlocProvider.of(context);

  Future<void> fetchMessages({required String patientId}) async {
    emit(GetMessagesLoadingState());
    var result = await chatDetailsRepo.fetchMessages(patientId: patientId);
    result.fold((faliure) {
      emit(GetMessagesError(error: faliure.message));
    }, (messages) {
      emit(GetMessagesSuccsses(messages: messages));
    });
  }

  void addMessage({required MessageModel message, required String patientId}) {
    chatDetailsRepo.addMessage(
      message: message,
      patientId: patientId,
    );
  }
}
