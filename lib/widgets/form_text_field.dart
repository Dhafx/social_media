import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final TextEditingController fieldController;
  final String type;
  final String fieldLabelText;

  const FormTextField({
    super.key,
    required this.fieldController,
    required this.type,
    required this.fieldLabelText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0x267737FF),
        border: Border.all(
          width: 1,
          color: const Color(0x407737FF),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: fieldController,
        obscureText: type == 'password' ? true : false,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          labelText: fieldLabelText,
          labelStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Color(0xBF7737FF),
          ),
        ),
      ),
    );
  }
}
