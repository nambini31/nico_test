import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

Widget svgIcon({
  required String iconPath,
  required Function()? onTap,
  double? height,
  double? width,
  bool? withColorFilter,
  Color? color,
}) =>
    GestureDetector(
      onTap: onTap,
      child: SvgPicture.asset(
        iconPath,
        width: width ?? 40,
        height: height ?? 40,
        colorFilter: (withColorFilter != null && withColorFilter)
            ? ColorFilter.mode(
                color ?? Colors.black,
                BlendMode.srcIn,
              )
            : null,
      ),
    );
