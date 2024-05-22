// ignore_for_file: camel_case_types, depend_on_referenced_packages

import 'package:equatable/equatable.dart';

abstract class User_event extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEvent extends User_event {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}