// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:nico_test/features/auth/data/repository/Auth_repository_impl.dart';
import 'package:nico_test/features/auth/data/sources/Auth_datasource.dart';
import 'package:nico_test/features/auth/presentation/bloc/User_bloc.dart';

import 'features/auth/presentation/pages/login_page.dart';

void main() {
  final http.Client httpClient = http.Client();
  final Auth_datasource remoteDataSource = AuthRemoteDataSourceImpl(client: httpClient);
  final AuthRepositoryImpl repository = AuthRepositoryImpl(remoteDataSource: remoteDataSource);
  final User_bloc authBloc = User_bloc(repository: repository);

  runApp(MyApp(authBloc: authBloc));
}

class MyApp extends StatelessWidget {
  final User_bloc authBloc;

  const MyApp({super.key, required this.authBloc});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Clean Architecture',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => authBloc,
        child: Login_page(),
      ),
    );
  }
}
