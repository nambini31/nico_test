// ignore_for_file: camel_case_types

import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entity/User.dart';

abstract class Auth_repository {
  Future<Either<Failure, User>> loginWithEmail(String email, String password);
  // Future<Either<Failure, User>> loginWithGoogle();
  // Future<Either<Failure, User>> getLastUser();
}