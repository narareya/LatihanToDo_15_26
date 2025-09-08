import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String myText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final BorderRadius? borderRadius;

  const CustomButton({
    super.key, 
    required this.myText, 
    required this.onPressed, 
    this.backgroundColor,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor ?? const Color(0xFF8B4513),
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(25),
          ),
          elevation: 5,
        ),
        child: Text(
          myText,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}