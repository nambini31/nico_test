// ignore_for_file: depend_on_referenced_packages, use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nico_test/core/utils/constants/app_theme.dart';
import 'package:nico_test/features/auth/presentation/bloc/User_bloc.dart';
import 'package:nico_test/features/auth/presentation/pages/Login_form.dart';



class Login_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      body: Login_form(),
    );
  }
}
