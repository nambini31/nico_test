import 'package:flutter/material.dart';


import 'paths.dart';
import 'text_style.dart';
import 'asset_image.dart';
import 'svg_image.dart';

Widget authHeader({
  required String firstH2,
  required String secondH2,
  required String indication,
  required bool withBackButton,
  required BuildContext ctx,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        (withBackButton)
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 21.0),
                    child: svgIcon(
                      iconPath: SoldoutPaths.backIconPath,
                      onTap: () {
                        Navigator.pop(ctx);
                      },
                      height: 19,
                      width: 22,
                    ),
                  ),
                  svgIcon(
                    iconPath: SoldoutPaths.infoLogoPath,
                    onTap: () {
                      // Navigator.push(
                      //   ctx,
                      //   MaterialPageRoute(
                      //     builder: (c) => InformationFAQScreen(),
                      //   ),
                      // );
                    },
                  ),
                ],
              )
            : svgIcon(
                iconPath: SoldoutPaths.infoLogoPath,
                onTap: () {
                  // Navigator.push(
                  //   ctx,
                  //   MaterialPageRoute(
                  //     builder: (c) => InformationFAQScreen(),
                  //   ),
                  // );
                },
              ),
        SizedBox(
          height: 10,
        ),
        assetImage(
          assetPath: SoldoutPaths.pngIconPath,
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          firstH2,
          style: SoldoutTextStyle.h2Text,
        ),
        Text(
          secondH2,
          style: SoldoutTextStyle.h2Text,
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          width: 300,
          child: Text(
            indication,
            style: SoldoutTextStyle.defaultText,
            textAlign: TextAlign.end,
          ),
        ),
      ],
    );
