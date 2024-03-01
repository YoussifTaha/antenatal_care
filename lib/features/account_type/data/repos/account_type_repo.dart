abstract class AccountTypeRepo {
  Future<void> createUser({
    required String email,
    required String fullName,
    required String phone,
    required String uId,
    required String userType,
  });
}
