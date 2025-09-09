import 'package:flutter/material.dart';
import 'package:noted/components/custom_datepicker.dart';
import 'package:noted/components/custom_dropdown.dart';
import 'package:noted/components/custom_text.dart';
import 'package:noted/components/custom_textfield.dart';
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/customradiobutton.dart';

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
                const CustomText(
                  text: '📝 Add New Task!',
                  color: Color(0xFF5D5D5D),
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                ),
                
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomTextField(
                    controller: TextEditingController(),
                    label: '✏️ Task Name',
                    backgroundColor: Colors.white,
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomDatePicker(
                    onDateSelected: (date) {
                      print("Date selected: $date");
                      backgroundColor: const Color(0xFFFFFFFF);
                    },
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomDropdown(
                    items: const ['Daily', 'Personal', 'Work', 'Other'],
                    onChanged: (value) {
                      print("Priority selected: $value");
                    },
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomRadioButton(
                        label: 'High',
                        isSelected: false,
                        onTap: () {
                          print("High priority selected");
                        },
                      ),
                      CustomRadioButton(
                        label: 'Medium',
                        isSelected: false,
                        onTap: () {
                          print("Medium priority selected");
                        },
                      ),
                      CustomRadioButton(
                        label: 'Low',
                        isSelected: false,
                        onTap: () {
                          print("Low priority selected");
                        },
                      ),
                    ],
                  ),
                ),
                
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
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
                            backgroundColor: const Color(0xFFA4B67C),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: CustomButton(
                            myText: "CANCEL",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            backgroundColor: const Color(0xFFFE8A4A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}