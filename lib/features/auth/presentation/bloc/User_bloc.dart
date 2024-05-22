import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:nico_test/features/auth/domain/repository/Auth_repository.dart';
import 'package:nico_test/features/auth/presentation/bloc/User_event.dart';
import 'package:nico_test/features/auth/presentation/bloc/User_state.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entity/User.dart';

class User_bloc extends Bloc<User_event, User_state> {
  final Auth_repository repository;

  User_bloc({required this.repository}) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
  }

  void _onLoginEvent(LoginEvent event, Emitter<User_state> emit) async {
    emit(AuthLoading());
    final failureOrUser = await repository.loginWithEmail(event.email, event.password);
    emit(_eitherLoadedOrErrorState(failureOrUser));
  }

  User_state _eitherLoadedOrErrorState(Either<Failure, User> failureOrUser) {
    return failureOrUser.fold(
      (failure) => AuthError(message: _mapFailureToMessage(failure)),
      (user) => AuthLoaded(user: user),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Failure';
      default:
        return 'Unexpected Error';
    }
  }
}
