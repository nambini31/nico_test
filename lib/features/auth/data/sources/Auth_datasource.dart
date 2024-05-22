// ignore_for_file: camel_case_types

// import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../core/error/exceptions.dart';
import '../models/UserModel.dart';

abstract class Auth_datasource {
  Future<UserModel> loginWithEmail(String email, String password);
  // Future<UserModel> loginWithGoogle();
}

class AuthRemoteDataSourceImpl implements Auth_datasource {
 // final GoogleSignIn googleSignIn;
  final http.Client client;

  AuthRemoteDataSourceImpl({
    //required this.googleSignIn,
    required this.client,
  });

  @override
  Future<UserModel> loginWithEmail(String email, String password) async {
   final response = await client.post(
      Uri.parse('https://api.soldoutnow.com/api/v1/login/access-token'),
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
      body: Uri(
        queryParameters: {
          'username': email,
          'password': password,
        },
      ).query,
    );

print(jsonDecode(response.body)) ;
    if (response.statusCode == 200) {
      print(jsonDecode(response.body)) ;
      return UserModel(id: "12", email: "Bonjour "+ email);
    } else {
      print(response.statusCode);
      return UserModel(id: "12", email: "error login");
    }
  }

  // @override
  // Future<UserModel> loginWithGoogle() async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
  //     if (googleUser == null) {
  //       throw ServerException();
  //     }

  //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //     return UserModel(id: googleUser.id, email: googleUser.email);
  //   } catch (e) {
  //     throw ServerException();
  //   }
  // }
}
