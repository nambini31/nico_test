import 'package:flutter/material.dart';

Widget assetImage({
  required String assetPath,
  double? width,
  double? height,
}) =>
    Image.asset(
      assetPath,
      width: width ?? 80,
      height: height ?? 80,
    );
