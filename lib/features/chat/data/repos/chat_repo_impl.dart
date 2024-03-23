import 'package:antenatal_app/core/Helpers/cach_helper.dart';
import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/core/networking/my_firebase.dart';
import 'package:antenatal_app/features/chat/data/repos/chat_repo.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';

class ChatRepoImpl extends ChatRepo {
  List<UserModel> myChats = [];
  MyFirebaseFireStoreService myFirebaseFireStoreService =
      MyFirebaseFireStoreService();
  @override
  Future<Either<Failure, List<UserModel>>> fetchMyChats() async {
    myChats = [];
    QuerySnapshot<Map<String, dynamic>> ChatsSnapshot =
        await myFirebaseFireStoreService.getDoctorChatsCollection(
            uId: '${CacheHelper.getData(key: 'uId')}');
    try {
      for (var element in ChatsSnapshot.docs) {
        myChats.add(UserModel.fromJson(element.data()));
      }
      return right(myChats);
    } on FirebaseException catch (e) {
      FirebaseFailure failure =
          FirebaseFailure.fromFirebaseFirestoreException(e);
      return left(
        failure,
      );
    }
  }

  @override
  void addNewChat({required String uId, required UserModel patient}) {
    CollectionReference myChatsCollection = myFirebaseFireStoreService
        .doctorCollection
        .doc(uId)
        .collection('myChats');
    myChatsCollection.doc('${patient.patientId}').set(patient.toJson());
  }
}
