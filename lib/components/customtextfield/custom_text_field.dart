import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {

  CustomTextField({this.hint, this.prefix, this.suffix, this.obscure = false,
    this.textInputType, this.onChanged, this.enabled, this.controller, this.inputFormatters, this.errorText, this.prefixText, this.labelText, this.maxLines
  });

  final TextEditingController controller;
  final String hint;
  final Widget prefix;
  final Widget suffix;
  final bool obscure;
  final TextInputType textInputType;
  final Function(String) onChanged;
  final bool enabled;
  final List<TextInputFormatter> inputFormatters;
  final String errorText;
  final String prefixText;
  final String labelText;
  final int maxLines;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        inputFormatters: inputFormatters,
        maxLines: maxLines,


        decoration: InputDecoration(
          hintText: hint,
          border: InputBorder.none,
          prefixIcon: prefix,
          suffixIcon: suffix,
          errorText: errorText,
          prefixText: prefixText,
          labelText: labelText,


        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
