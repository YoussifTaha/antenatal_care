import 'package:antenatal_app/features/account_type/data/repos/account_type_repo.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AccountTypeRepoImpl extends AccountTypeRepo {
  @override
  Future<void> createUser(
      {required String email,
      required String fullName,
      required String phone,
      required String uId,
      required String userType,
      required int patientId}) async {
    UserModel userModel = UserModel(
        fullName: fullName,
        email: email,
        phone: phone,
        uId: uId,
        userType: userType,
        patientId: patientId);
    addPatientToDataBase(userType: userType, uId: uId, userModel: userModel);
  }

  void addPatientToDataBase(
      {required String userType,
      required String uId,
      required UserModel userModel}) {
    FirebaseFirestore.instance
        .collection(userType)
        .doc(uId)
        .set(userModel.toJson());
  }
}
