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

class AddTaskWide extends StatelessWidget {
  final TodoController taskController = Get.find<TodoController>();
  
  AddTaskWide({super.key});
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDFCAB5),
      body: Center(
        child: SingleChildScrollView(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left side - Task Info
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(20),
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
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      
                      SizedBox(height: 20),
                      
                      CustomTextField(
                        controller: taskController.taskController,
                        label: '✏️ Task Name',
                        backgroundColor: Colors.white,
                      ),
                      
                      SizedBox(height: 20),
                      
                      CustomDatePicker(
                        onDateSelected: (date) {
                          Get.find<TodoController>().setDueDate(date);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              
              // Right side - Category & Priority
              Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.all(20),
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
                        text: '⚙️ Task Settings',
                        color: Color(0xFF5D5D5D),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        textAlign: TextAlign.center,
                      ),
                      
                      SizedBox(height: 20),
                      
                      // Category Dropdown
                      Obx(() {
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
                              _showAddCategoryDialog();
                            } else if (value != null) {
                              taskController.selectedCategory.value = value;
                            }
                          },
                          placeholder: "Select Category",
                        );
                      }),
                      
                      SizedBox(height: 20),
                      
                      // Priority Selection
                      const CustomText(
                        text: 'Priority Level',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF5D5D5D),
                        textAlign: TextAlign.center,
                      ),
                      
                      SizedBox(height: 12),
                      
                      Obx(() => Column(
                        children: [
                          CustomRadioButton(
                            label: 'High Priority',
                            isSelected: taskController.selectedPriority.value == 'High',
                            onTap: () => taskController.selectedPriority.value = 'High',
                          ),
                          SizedBox(height: 8),
                          CustomRadioButton(
                            label: 'Medium Priority',
                            isSelected: taskController.selectedPriority.value == 'Medium',
                            onTap: () => taskController.selectedPriority.value = 'Medium',
                          ),
                          SizedBox(height: 8),
                          CustomRadioButton(
                            label: 'Low Priority',
                            isSelected: taskController.selectedPriority.value == 'Low',
                            onTap: () => taskController.selectedPriority.value = 'Low',
                          ),
                        ],
                      )),
                      
                      SizedBox(height: 30),
                      
                      // Action Buttons
                      Row(
                        children: [
                          Expanded(
                            child: CustomButton( 
                              myText: "ADD TASK",
                              onPressed: _addTask,
                              backgroundColor: const Color(0xFFA4B67C),
                            ),
                          ),
                          SizedBox(width: 16),
                          Expanded(
                            child: CustomButton(
                              myText: "CANCEL",
                              onPressed: () => Navigator.pop(context),
                              backgroundColor: AppColors.paleYellow,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _showAddCategoryDialog() {
    Get.defaultDialog(
      title: "New Category",
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: taskController.categoryController,
            decoration: InputDecoration(hintText: "Category Name"),
          ),
          SizedBox(height: 16),
          CustomButton(
            myText: "Add", 
            onPressed: () {
              final newCategory = taskController.categoryController.text.trim();
              if (newCategory.isNotEmpty) {
                taskController.addCategory(newCategory);
                Get.back();
              }
            }
          ),
        ],
      ),
    );
  }
  
  void _addTask() {
    if (taskController.taskController.text.isEmpty || 
        taskController.selectedCategory.value.isEmpty || 
        taskController.selectedPriority.value.isEmpty) {
      Get.snackbar(
        "Warning", 
        "⚠️ Please fill all fields",
        backgroundColor: const Color.fromARGB(255, 179, 24, 24),
        colorText: Colors.white,
      );
      return;
    }

    TaskModel newTask = TaskModel(
      title: taskController.taskController.text,
      priority: taskController.selectedPriority.value,
    );

    taskController.addTask(taskController.selectedCategory.value, newTask);

    // Clear fields
    taskController.taskController.clear();
    taskController.selectedCategory.value = '';
    taskController.selectedPriority.value = '';

    Get.snackbar(
      "Success", 
      "✅ Task added!",
      backgroundColor: AppColors.paleGreen,
      colorText: Colors.black,
    );

    Get.toNamed(AppRoutes.dashboard, arguments: taskController.tasks.keys.toList());
  }
}