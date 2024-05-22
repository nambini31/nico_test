import 'package:flutter/material.dart';
import 'svg_image.dart';

Widget fieldPrefixIcon({required String iconPath}) => Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 14,
      ),
      child: svgIcon(
        iconPath: iconPath,
        onTap: null,
        height: 15,
        width: 15,
      ),
    );
