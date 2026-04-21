import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final double fontSize;
  final VoidCallback onPressed;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.fontSize,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(fontSize: fontSize),
        ),
      ),
    );
  }
}