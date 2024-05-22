import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget smobile;
  final Widget lmobile;

  const Responsive({
    super.key,
    required this.smobile,
    required this.lmobile,
  });
  static bool isSMobile(BuildContext context) =>
      MediaQuery.of(context).size.height < 812;

  static bool isLMobile(BuildContext context) =>
      MediaQuery.of(context).size.height >= 812;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 812) {
          return lmobile;
        } else {
          return smobile;
        }
      },
    );
  }
}
