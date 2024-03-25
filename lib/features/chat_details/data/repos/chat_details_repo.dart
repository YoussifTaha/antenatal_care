import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/chat_details/data/models/message_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChatDetailsRepo {
  Future<Either<Failure, List<MessageModel>>> fetchMessages(
      {required String patientId});

  void addMessage({required MessageModel message, required String patientId});
}
