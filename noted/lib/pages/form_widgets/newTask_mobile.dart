import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

class AddTaskMobile extends StatelessWidget {
  final TodoController taskController = Get.find<TodoController>();
  
  AddTaskMobile({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFCAB5),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
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
                
                // Task Name
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: CustomTextField(
                    controller: taskController.taskController,
                    label: '✏️ Task Name',
                    backgroundColor: Colors.white,
                  ),
                ),
                
                // Date Picker
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomDatePicker(
                    onDateSelected: (date) {
                      taskController.setDueDate(date);
                    },
                  ),
                ),

                // Category Dropdown
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Obx(() {
                    final categories = taskController.tasks.keys.toList();
                    final items = [...categories, "Add New Category"];

                    return CustomDropdown(
                      items: items,
                      value: taskController.selectedCategory.value.isEmpty
                          ? null
                          : taskController.selectedCategory.value,
                      onChanged: (value) {
                        if (value == "Add New Category") {
                          taskController.categoryController.clear();

                          Get.defaultDialog(
                            title: "New Category",
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                TextField(
                                  controller: taskController.categoryController,
                                  decoration: const InputDecoration(
                                    hintText: "Category Name"
                                  ),
                                ),
                                const SizedBox(height: 16),
                                CustomButton(
                                  myText: "Add",
                                  onPressed: () {
                                    final newCategory = taskController.categoryController.text.trim();
                                    if (newCategory.isNotEmpty) {
                                      taskController.addCategory(newCategory);
                                      Get.back();
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        } else if (value != null) {
                          taskController.selectedCategory.value = value;
                        }
                      },
                      placeholder: "Select Category",
                    );
                  }),
                ),
                
                // Priority Radio Buttons
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Obx(() => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomRadioButton(
                        label: 'High',
                        isSelected: taskController.selectedPriority.value == 'High',
                        onTap: () {
                          taskController.selectedPriority.value = 'High';
                        },
                      ),
                      CustomRadioButton(
                        label: 'Medium',
                        isSelected: taskController.selectedPriority.value == 'Medium',
                        onTap: () {
                          taskController.selectedPriority.value = 'Medium';
                        },
                      ),
                      CustomRadioButton(
                        label: 'Low',
                        isSelected: taskController.selectedPriority.value == 'Low',
                        onTap: () {
                          taskController.selectedPriority.value = 'Low';
                        },
                      ),
                    ],
                  )),
                ),
                
                // Action Buttons
                Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: Row(
                    children: [
                      // Add Button
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 8),
                          child: CustomButton(
                            myText: "ADD",
                            onPressed: () {
                              if (taskController.taskController.text.isEmpty ||
                                  taskController.selectedCategory.value.isEmpty ||
                                  taskController.selectedPriority.value.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("⚠️ Please fill all fields"),
                                    backgroundColor: Color.fromARGB(255, 179, 24, 24),
                                  ),
                                );
                                return;
                              }

                              TaskModel newTask = TaskModel(
                                title: taskController.taskController.text,
                                priority: taskController.selectedPriority.value,
                              );

                              taskController.addTask(
                                taskController.selectedCategory.value,
                                newTask,
                              );

                              // Clear fields
                              taskController.taskController.clear();
                              taskController.selectedCategory.value = '';
                              taskController.selectedPriority.value = '';

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text("✅ Task added!"),
                                  backgroundColor: AppColors.paleGreen,
                                ),
                              );

                              Get.toNamed(
                                AppRoutes.dashboard,
                                arguments: taskController.tasks.keys.toList(),
                              );
                            },
                            backgroundColor: const Color(0xFFA4B67C),
                          ),
                        ),
                      ),
                      
                      // Cancel Button
                      Expanded(
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