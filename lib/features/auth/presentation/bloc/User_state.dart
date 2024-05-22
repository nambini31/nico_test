// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:equatable/equatable.dart';

import '../../domain/entity/User.dart';

abstract class User_state extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends User_state {}

class AuthLoading extends User_state {}

class AuthLoaded extends User_state {
  final User user;

  AuthLoaded({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthError extends User_state {
  final String message;

  AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}
