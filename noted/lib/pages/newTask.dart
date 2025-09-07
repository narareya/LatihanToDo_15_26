import 'package:flutter/material.dart';
import 'package:noted/components/custom_text.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: CustomText(
          text: 'Add New Task!', 
          color: Colors.black, 
          fontSize: 24, 
          fontWeight: FontWeight.bold, 
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}