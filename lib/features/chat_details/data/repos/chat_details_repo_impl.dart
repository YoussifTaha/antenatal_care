import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/chat_details/data/models/message_model.dart';
import 'package:antenatal_app/features/chat_details/data/repos/chat_details_repo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class ChatDetailsRepoImpl extends ChatDetailsRepo {
  List<MessageModel> messages = [];
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();

  @override
  Future<Either<Failure, List<MessageModel>>> fetchMessages(
      {required String patientId}) async {
    Stream<QuerySnapshot<Map<String, dynamic>>> messageSnapshot =
        await myFirebaseFireStoreService.getMessagesCollection(
            patientId: patientId);
    try {
      messageSnapshot.listen((event) {
        event.docs.forEach((element) {
          messages.add(MessageModel.fromJson(element.data()));
        });
      });
      List<MessageModel> filteredMessages = filterMessages();
      print(filteredMessages.length);
      return right(filteredMessages);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  List<MessageModel> filterMessages() {
    List<MessageModel> filteredMessages = messages
        .fold<Map<String, MessageModel>>({}, (map, element) {
          map.putIfAbsent(element.dateTime, () => element);
          return map;
        })
        .values
        .toList();
    return filteredMessages;
  }

  @override
  void addMessage({required MessageModel message, required String patientId}) {
    DocumentReference<Object?> documentReference =
        myFirebaseFireStoreService.myChatsDoc(patientId);
    documentReference.collection('messages').doc().set(message.toJson());
  }
}
