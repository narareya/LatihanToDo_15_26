import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;  
  final TextAlign textAlign;

const CustomText({
  Key? key,
  required this.text,
  required this.color,
  required this.fontSize,
  required this.fontWeight,
  required this.textAlign,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ),
      textAlign: textAlign,
    );
  }
}