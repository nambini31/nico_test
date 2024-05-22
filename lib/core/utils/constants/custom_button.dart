import 'package:flutter/material.dart';

Widget customButton({
  required String buttonText,
  required Color buttonColor,
  required Color textColor,
  required double width,
  required void Function() onTap,
}) =>
    GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        padding: EdgeInsets.symmetric(
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: textColor,
              fontSize: 16.5,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
