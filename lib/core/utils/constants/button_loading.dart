import 'package:flutter/material.dart';

Widget buttonLoading({
  required Color buttonColor,
  required Color progressColor,
}) =>
    Container(
      width: 50,
      padding: EdgeInsets.symmetric(
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Center(
        child: SizedBox(
          height: 20,
          width: 20,
          child: CircularProgressIndicator(
            color: progressColor,
          ),
        ),
      ),
    );
