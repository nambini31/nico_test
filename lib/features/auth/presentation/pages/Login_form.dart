// ignore_for_file: camel_case_types, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nico_test/core/utils/constants/ScreenContainer.dart';
import 'package:nico_test/features/auth/presentation/bloc/User_bloc.dart';
import 'package:nico_test/features/auth/presentation/bloc/User_event.dart';
import 'package:nico_test/features/auth/presentation/bloc/User_state.dart';

import '../../../../core/utils/constants/app_theme.dart';
import '../../../../core/utils/constants/auth_header.dart';
import '../../../../core/utils/constants/button_loading.dart';
import '../../../../core/utils/constants/custom_button.dart';
import '../../../../core/utils/constants/custom_text_field.dart';
import '../../../../core/utils/constants/field_prefix.dart';
import '../../../../core/utils/constants/paths.dart';
import '../../../../core/utils/constants/svg_image.dart';
import '../../../../core/utils/constants/text_style.dart';

class Login_form extends StatefulWidget {
  @override
  _Login_formState createState() => _Login_formState();
}

class _Login_formState extends State<Login_form> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isGoogleReady = true;
  bool _isFacebookReady = false;
  bool _isInstaReady = false;
  bool _isLinkedInReady = false;
  bool _buttonLoading = false;
  bool _isTiktokReady = false;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return ScreenContainer(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: const EdgeInsets.only(right:20),
        child: Form(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                authHeader(
                  firstH2: "Se connecter à mon",
                  secondH2: "compte SoldOut",
                  indication: "Veuillez remplir les formulaires",
                  withBackButton: false,
                  ctx: context,
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildFields(),
                const SizedBox(
                  height: 20,
                ),
                _buildForgotPassword(),
                const SizedBox(
                  height: 20,
                ),
                _buildRememberMe(),
                const SizedBox(
                  height: 40,
                ),
                Align(
                  alignment: Alignment.center,
                  child: customButton(
                    width: 175,
                    buttonText: "Se connecter",
                    buttonColor: SoldoutColors.white,
                    textColor: SoldoutColors.textButtonColor,
                    onTap: () {
                      _onLoginButtonPressed();
                    },
                  ),
                ),
                _buildLoginButton(),
                const SizedBox(
                  height: 30,
                ),
                _buildTextConnectWithSocialMedia(screenSize.height),
                const SizedBox(
                  height: 25,
                ),
                _socialMediaButtons(),
                const SizedBox(
                  height: 20,
                ),
                _buildSignUp(),
                const SizedBox(
                  height: 14,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }











































































































































































































































































































































































































  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Form(
  //       child: Column(
  //         children: [
  //           TextFormField(
  //             controller: _emailController,
  //             decoration: InputDecoration(labelText: 'Email'),
  //           ),
  //           TextFormField(
  //             controller: _passwordController,
  //             decoration: InputDecoration(labelText: 'Password'),
  //             obscureText: true,
  //           ),
  //           SizedBox(height: 20),
  //           ElevatedButton(
  //             onPressed: _onLoginButtonPressed,
  //             child: Text('Login'),
  //           ),
  //           BlocBuilder<User_bloc, User_state>(
  //             builder: (context, state) {
  //               if (state is AuthLoading) {
  //                 return CircularProgressIndicator();
  //               } else if (state is AuthLoaded) {
  //                 return Text('${state.user.email}');
  //               } else if (state is AuthError) {
  //                 return Text('Error: ${state.message}');
  //               }
  //               return Container();
  //             },
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  _buildSignUp() => SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            Text(
              "Vous n’avez pas de compte ? ",
              style: SoldoutTextStyle.defaultText,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "S’inscrire",
                style: SoldoutTextStyle.defaultPrimaryText,
              ),
            )
          ],
        ),
      );

  _socialMediaButtons() => SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
            iconContainer(
              opacity: 0.08,
              iconPath: SoldoutPaths.googleEmailLogoPath,
              onTap: () {},
              isReady: _isGoogleReady,
            ),
            const SizedBox(
              width: 20,
            ),
            iconContainer(
              opacity: 0.08,
              iconPath: SoldoutPaths.facebookLogoPath,
              onTap: null,
              isReady: _isFacebookReady,
            ),
            const SizedBox(
              width: 20,
            ),
            iconContainer(
              opacity: 0.08,
              iconPath: SoldoutPaths.instaLogoPath,
              onTap: null,
              isReady: _isInstaReady,
            ),
            const SizedBox(
              width: 20,
            ),
            iconContainer(
              opacity: 0.08,
              iconPath: SoldoutPaths.linkedInLogoPath,
              onTap: null,
              isReady: _isLinkedInReady,
            ),
            const SizedBox(
              width: 20,
            ),
            iconContainer(
              opacity: 0.08,
              iconPath: SoldoutPaths.tiktokLogoPath,
              onTap: null,
              isReady: _isTiktokReady,
            ),
          ],
        ),
      );

  Widget iconContainer(
          {required double opacity,
          required String iconPath,
          required void Function()? onTap,
          required bool isReady}) =>
      GestureDetector(
        onTap: onTap,
        child: Opacity(
          opacity: (isReady) ? 1 : 0.3,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            margin: const EdgeInsets.only(bottom: 15),
            decoration: BoxDecoration(
              color: SoldoutColors.primaryColor.withOpacity(opacity),
              borderRadius: BorderRadius.circular(10),
            ),
            child: svgIcon(
              iconPath: iconPath,
              onTap: null,
              width: 30,
              height: 30,
            ),
          ),
        ),
      );

  _buildTextConnectWithSocialMedia(double mobileHeight) => Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 1,
              width: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    SoldoutColors.primaryColor,
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Se connecter via les réseaux sociaux",
                style: TextStyle(
                  fontSize: 10,
                  color: SoldoutColors.primaryColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              height: 1,
              width: 36,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    SoldoutColors.primaryColor,
                    Colors.black,
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  _buildLoginButton() => Align(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: BlocBuilder<User_bloc, User_state>(
            builder: (context, state) {
              if (state is AuthLoading) {
                return CircularProgressIndicator(
                  color: Colors.white,
                );
              } else if (state is AuthLoaded) {
                return Text(
                  '${state.user.email}',
                  style: TextStyle(color: Colors.white),
                );
              } else if (state is AuthError) {
                return Text('Error: ${state.message}');
              }
              return Container();
            },
          ),
        ),
      );

  _buildRememberMe() => Container(
        padding: const EdgeInsets.only(left: 20),
        child: Row(
          children: [
            Transform.scale(
              scale: 1.2,
              child: Checkbox(
                value: _rememberMe,
                activeColor: SoldoutColors.white,
                onChanged: (v) {
                  setState(() {
                    _rememberMe = v!;
                  });
                },
                side: BorderSide(
                  color: SoldoutColors.white,
                ),
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (!states.contains(MaterialState.selected)) {
                    return SoldoutColors.white;
                  }
                  return null;
                }),
                checkColor: SoldoutColors.primaryColor,
              ),
            ),
            Text(
              "Se souvenir de moi",
              style: SoldoutTextStyle.defaultText,
            ),
          ],
        ),
      );

  _buildForgotPassword() => InkWell(
        onTap: () {},
        child: Text(
          "Mot de passe oublié ?",
          style: SoldoutTextStyle.defaultPrimaryText,
        ),
      );

  _buildFields() => Container(
        width: double.infinity,
        padding: const EdgeInsets.only(left: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomField(
              controller: _emailController,
              prefixIcon: fieldPrefixIcon(iconPath: SoldoutPaths.emailIconPath),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Entrer votre email";
                }
                return null;
              },
              labelText: "Adresse email",
              isPassword: false,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomField(
              controller: _passwordController,
              prefixIcon:
                  fieldPrefixIcon(iconPath: SoldoutPaths.passwordIconPath),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Entrer votre mot de passe";
                }
                return null;
              },
              labelText: "Mot de passe",
              isPassword: true,
            ),
          ],
        ),
      );

  void _onLoginButtonPressed() {
    BlocProvider.of<User_bloc>(context).add(
      LoginEvent(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
