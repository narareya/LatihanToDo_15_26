import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:noted/components/custom_datepicker.dart';
import 'package:noted/components/custom_dropdown.dart';
import 'package:noted/components/custom_text.dart';
import 'package:noted/components/custom_textfield.dart';
import 'package:noted/components/custom_button.dart';
import 'package:noted/components/custom_color.dart';
import 'package:noted/components/customradiobutton.dart';
import 'package:noted/controller/ToDo_controller.dart';
import 'package:noted/models/task_model.dart';
import 'package:noted/routes/routes.dart';

class AddTaskPage extends StatelessWidget {
  final TodoController todoController = Get.find<TodoController>();
  
  AddTaskPage({super.key});
 

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
              color: AppColors.lightCream,
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
                
                
                Container( // nama task
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomTextField(
                    controller: todoController.taskController,
                    label: '✏️ Task Name',
                    backgroundColor: Colors.white,
                  ),
                ),
                
                
                Container( // date picker
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomDatePicker(
                    onDateSelected: (date) {
                      print("Date selected: $date");
                    },
                  ),
                ),
                
                Container( // dropdown category
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Obx(() => CustomDropdown(
                    items: todoController.tasks.keys.toList(),
                    value: todoController.selectedCategory.value.isEmpty
                        ? null
                        : todoController.selectedCategory.value,
                    onChanged: (value) {
                      if (value != null) {
                        todoController.selectedCategory.value = value;
                      }
                      print("Category selected: $value");
                    },
                    placeholder: "Pilih kategori",
                  ),) 
                ),
                
                Container( // radiobutton priority
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomRadioButton(
                        label: 'High',
                        isSelected: todoController.selectedPriority.value == 'High',
                        onTap: () {
                          todoController.selectedPriority.value = 'High';
                          print("High priority selected");
                        },
                      ),
                      CustomRadioButton(
                        label: 'Medium',
                        isSelected: todoController.selectedPriority.value == 'Medium',
                        onTap: () {
                          todoController.selectedPriority.value = 'Medium';
                          print("Medium priority selected");
                        },
                      ),
                      CustomRadioButton(
                        label: 'Low',
                        isSelected: todoController.selectedPriority.value == 'Low',
                        onTap: () {
                          todoController.selectedPriority.value = 'Low';
                          print("Low priority selected");
                        },
                      ),
                    ],
                  ),) 
                ),
                
                Container( // button add & cancel
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      
                      Expanded( // add button
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: CustomButton( 
                            myText: "ADD",
                            onPressed: () {
                              if (todoController.taskController.text.isEmpty || todoController.selectedCategory.value.isEmpty || todoController.selectedPriority.value.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("⚠️ Please fill all fields"),
                                    backgroundColor: AppColors.dustyPink,
                                  ),
                                );
                                return;
                              }

                              // new task
                              final newTask = TaskModel(
                                title: todoController.taskController.text,
                                priority: todoController.selectedPriority.value
                              );

                              // add task
                              todoController.addTask(
                                todoController.selectedCategory.value, 
                                newTask
                              );

                              // clear
                              todoController.taskController.clear();
                              todoController.selectedCategory.value = '';
                              todoController.selectedPriority.value = '';
                              

                              // notification
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("✅ Task added!"),
                                  backgroundColor: AppColors.lightGreen,
                                ),
                              );

                              Get.offNamed(AppRoutes.dashboard);
                            },
                            backgroundColor: const Color(0xFFA4B67C),
                          ),
                        ),
                      ),


                      Expanded( // cancel button
                        child: Container(
                          margin: const EdgeInsets.only(left: 8),
                          child: CustomButton(
                            myText: "CANCEL",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            backgroundColor: AppColors.paleYellow,
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