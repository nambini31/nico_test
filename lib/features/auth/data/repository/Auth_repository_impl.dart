import 'package:dartz/dartz.dart';
import 'package:nico_test/features/auth/data/sources/Auth_datasource.dart';
import 'package:nico_test/features/auth/domain/repository/Auth_repository.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entity/User.dart';


class AuthRepositoryImpl implements Auth_repository {
  final Auth_datasource remoteDataSource;
  //final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
    required this.remoteDataSource,
   // required this.localDataSource,
  });

  @override
  Future<Either<Failure, User>> loginWithEmail(String email, String password) async {
    try {
      final remoteUser = await remoteDataSource.loginWithEmail(email, password);
      //localDataSource.cacheUser(remoteUser);
      return Right(remoteUser);
    } on ServerException {
      return const Left(ServerFailure());
    }
  }

  // @override
  // Future<Either<Failure, User>> loginWithGoogle() async {
  //   try {
  //     final remoteUser = await remoteDataSource.loginWithGoogle();
  //     localDataSource.cacheUser(remoteUser);
  //     return Right(remoteUser);
  //   } on ServerException {
  //     return Left(ServerFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, User>> getLastUser() async {
  //   try {
  //     final localUser = await localDataSource.getLastUser();
  //     return Right(localUser);
  //   } on CacheException {
  //     return Left(CacheFailure());
  //   }
  // }
}
