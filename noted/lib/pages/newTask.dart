import 'package:flutter/material.dart';
import 'package:noted/components/custom_datepicker.dart';
import 'package:noted/components/custom_dropdown.dart';
import 'package:noted/components/custom_text.dart';
import 'package:noted/components/custom_textfield.dart';
import 'package:noted/components/custom_button.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFCAB5),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: const Color(0xFFF0DAC7),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.brown.withOpacity(0.2),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                
                const CustomText(
                  text: '📝 Add New Task!',
                  color: Color(0xFF5D5D5D),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                
                const SizedBox(height: 35),
                
                CustomTextField(
                  controller: TextEditingController(),
                  label: '✏️ Task Name',
                ),
                
                const SizedBox(height: 20),
                
                CustomDatePicker(
                  onDateSelected: (date) {
                    print("Date selected: $date");
                  },
                ),
                
                const SizedBox(height: 20),
                
                CustomDropdown(
                  items: const ['🔴 High', '🟡 Medium', '🟢 Low'],
                  onChanged: (value) {
                    print("Priority selected: $value");
                  },
                  
                ),
                
                const SizedBox(height: 40),
                
                // Buttons Row
                Row(
                  children: [
                                        Expanded(
                      child: CustomButton(
                        myText: "ADD",
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("✅ Task added!"),
                              backgroundColor: Color(0xFFA4B67C),
                            ),
                          );
                        },
                        backgroundColor: Color(0xFFA4B67C),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: CustomButton(
                        myText: "CANCEL",
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        backgroundColor: const Color(0xFFFE8A4A4),
                      ),
                    ),
                    
                    const SizedBox(width: 15),
                    

                  ],
                ),
                
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}