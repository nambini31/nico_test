import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'text_style.dart';
import 'app_theme.dart';

class CustomField1 extends StatefulWidget {
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool isPassword;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final String? initialValue;
  final bool? readOnly;
  final String? hintText;
  final int? maxLines;
  final bool? withoutBorder;
  final void Function()? onTap;
  final void Function(String)? onChanged;
  const CustomField1({
    super.key,
    required this.controller,
    required this.validator,
    required this.isPassword,
    this.keyboardType,
    this.inputFormatters,
    this.initialValue,
    this.prefixIcon,
    this.readOnly,
    this.hintText,
    this.maxLines,
    this.onTap,
    this.withoutBorder,
    this.onChanged,
  });

  @override
  State<CustomField1> createState() => _CustomField1State();
}

class _CustomField1State extends State<CustomField1> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: widget.readOnly ?? false,
      initialValue: widget.initialValue,
      style: TextStyle(
        color: SoldoutColors.white,
      ),
      controller: widget.controller,
      onChanged: widget.onChanged,
      onTap: widget.onTap,
      validator: widget.validator,
      obscureText: widget.isPassword ? _obscureText : false,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: (widget.withoutBorder != null)
            ? Colors.black
            : Color(0xff01353D).withOpacity(0.5),
        hintText: widget.hintText,
        hintStyle: TextStyle(
          fontSize: 14,
          color: SoldoutColors.white.withOpacity(0.6),
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: (widget.withoutBorder != null)
                ? Colors.black
                : SoldoutColors.primaryColor,
            width: (widget.withoutBorder != null) ? 0 : 1,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        prefixIcon: widget.prefixIcon,
        suffixIcon: (widget.isPassword)
            ? GestureDetector(
                onTap: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
                child: Icon(
                  _obscureText ? Icons.visibility : Icons.visibility_off,
                  color: Colors.white,
                ),
              )
            : null,
        labelStyle: SoldoutTextStyle.defaultText,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: SoldoutColors.primaryColor,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: SoldoutColors.primaryColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(
            color: SoldoutColors.primaryColor,
            width: 1,
          ),
        ),
      ),
    );
  }
}
