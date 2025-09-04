import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String myText;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.myText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(myText),
    );
  }
}