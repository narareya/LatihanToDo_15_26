import 'package:flutter/material.dart';
import 'package:noted/components/custom_color.dart';

class CustomDatePicker extends StatefulWidget {
  final Function(DateTime) onDateSelected;
  final DateTime? initialDate;

  const CustomDatePicker({
    super.key,
    required this.onDateSelected,
    this.initialDate,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  String _formatDate(DateTime date) {
    final months = [
      '', 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return "${date.day} ${months[date.month]} ${date.year}";
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _selectDate,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.lightCream, // ← Changed from lightBeige to lightCream
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Row(
          children: [
            const Icon(Icons.calendar_today, color: Colors.black54),
            const Padding(padding: EdgeInsets.only(left: 12)),
            Text(
              selectedDate != null 
                  ? _formatDate(selectedDate!)
                  : 'Due Date',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}