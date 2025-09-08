import 'package:flutter/material.dart';

class CustomDropdown extends StatelessWidget {
  final List<String> items;
  final String? value;
  final Function(String?) onChanged;
  final String? placeholder; // ← Tambah parameter placeholder

  const CustomDropdown({
    super.key,
    required this.items,
    required this.onChanged,
    this.value,
    this.placeholder, // ← Tambah parameter ini
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(color: const Color.fromARGB(255, 0, 0, 0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton<String>(
        value: value,
        hint: Text(
          placeholder ?? "Pilih kategori", // ← Gunakan placeholder
          style: const TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 16,
          ),
        ),
        isExpanded: true,
        underline: Container(), // Hilangkan underline default
        items: items.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }
}