import 'package:flutter/material.dart';

Widget roundedImage({
  required String src,
  required double? width,
  required double? height,
}) =>
    PhysicalModel(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      clipBehavior: Clip.antiAlias,
      elevation: 5.0,
      child: Image.network(
        src,
        width: width,
        height: height,
        fit: BoxFit.cover,
      ),
    );
