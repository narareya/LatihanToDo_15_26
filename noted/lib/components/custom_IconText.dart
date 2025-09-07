import 'package:flutter/material.dart';

class IconTextDisplay extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color? iconColor;
  final Color? textColor;
  final double? iconSize;
  final MainAxisAlignment alignment;
  final bool isVertical;

  const IconTextDisplay({
    super.key,
    required this.icon,
    required this.text,
    this.iconColor,
    this.textColor,
    this.iconSize,
    this.alignment = MainAxisAlignment.start,
    this.isVertical = false,
  });

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      icon,
      color: iconColor ?? Colors.grey[600],
      size: iconSize ?? 24,
    );

    final textWidget = Text(
      text,
      style: TextStyle(
        color: textColor ?? Colors.grey[800],
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );

    if (isVertical) {
      return Column(
        mainAxisAlignment: alignment,
        children: [
          iconWidget,
          const SizedBox(height: 8),
          textWidget,
        ],
      );
    }

    return Row(
      mainAxisAlignment: alignment,
      children: [
        iconWidget,
        const SizedBox(width: 12),
        textWidget,
      ],
    );
  }
}