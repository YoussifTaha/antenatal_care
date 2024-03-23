import 'package:antenatal_app/features/signup/data/model/user_model.dart';

abstract class AccountTypeRepo {
  Future<void> createUser({
    required String email,
    required String fullName,
    required String phone,
    required String uId,
    required String userType,
    required int patientId,
  });

  void addPatientToDataBase(
      {required String userType,
      required String uId,
      required UserModel userModel});
}
