import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscure;
  final List<TextInputFormatter>? inputFormatters;
  final String? fontFamily;
  final Color? backgroundColor;
  final Color? textColor;
  final BorderRadius? borderRadius;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.label,
    this.obscure = false,
    this.inputFormatters,
    this.fontFamily,
    this.backgroundColor,
    this.textColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscure,
      inputFormatters: inputFormatters,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: borderRadius ?? BorderRadius.circular(20),
        ),
        filled: true,
        fillColor: backgroundColor ?? Colors.white,
        labelStyle: TextStyle(
          color: textColor ?? const Color.fromARGB(255, 0, 0, 0),
          fontFamily: fontFamily,
        ),
      ),
    );
  }
}