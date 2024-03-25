import 'package:antenatal_app/features/chat/data/repos/chat_repo.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this.chatRepo) : super(ChatInitial());

  final ChatRepo chatRepo;

  static ChatCubit get(context) => BlocProvider.of(context);

  Future<void> fetchPatientUser() async {
    emit(GetChatsLoadingState());
    var result = await chatRepo.fetchMyChats();
    result.fold((faliure) {
      emit(GetChatsError(error: faliure.message));
    }, (patient) {
      emit(GetChatsSuccsses(patients: patient));
    });
  }

  void addNewChat({required UserModel patient}) {
    chatRepo.addNewChat(patient: patient);
  }
}
