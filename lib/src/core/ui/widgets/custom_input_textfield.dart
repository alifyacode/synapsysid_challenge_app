import 'package:flutter/material.dart';

class CustomInputTextfield extends StatelessWidget {
  final Icon icon;
  final String label;
  final Function(String) onChanged;
  final bool obscureText;
  const CustomInputTextfield({
    Key? key,
    required this.icon,
    required this.label,
    required this.onChanged,
    this.obscureText = false
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: icon,
          hintText: label,
          
        ),
        onChanged: onChanged,
      ),
    );
  }
}
