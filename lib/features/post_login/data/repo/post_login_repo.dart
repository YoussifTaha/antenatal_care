import 'package:antenatal_app/core/errors/faliure.dart';
import 'package:dartz/dartz.dart';

abstract class PostLoginRepo {
  Future<Either<Failure, String>> fetchUserType({required String uId});
}
