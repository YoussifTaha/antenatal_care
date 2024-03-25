import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:antenatal_app/features/signup/data/model/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class ChatRepo {
  Future<Either<Failure, List<UserModel>>> fetchMyChats();

  void addNewChat({required UserModel patient});
}
