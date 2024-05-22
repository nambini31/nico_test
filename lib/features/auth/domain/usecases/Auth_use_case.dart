// ignore_for_file: file_names, camel_case_types

import 'package:dartz/dartz.dart';
import 'package:nico_test/features/auth/domain/repository/Auth_repository.dart';
import '../../../../core/error/failures.dart';
import '../entity/User.dart';

class Auth_use_case {
  
  final Auth_repository repository;

  Auth_use_case(this.repository);

  Future<Either<Failure, User>> call(String email, String password) async {
    return await repository.loginWithEmail(email, password);
  }
}