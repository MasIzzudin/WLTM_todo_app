import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {super.key,
      required this.controller,
      this.onChanged,
      this.prefix,
      this.prefixIcon,
      this.prefixIconColor,
      this.sufix,
      this.sufixIcon,
      this.sufixIconColor,
      this.contentPadding,
      this.hintText,
      this.border,
      this.enableBorder,
      this.focusedBorder,
      this.errorBorder,
      this.validator,
      this.textInputType,
      this.obsecureText = false,
      this.autovalidateMode,
      this.errorText,
      this.onSaved,
      this.enable,
      this.fillColor});

  final TextEditingController controller;
  final Function(String)? onChanged;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Color? prefixIconColor;
  final Widget? sufix;
  final Widget? sufixIcon;
  final Color? sufixIconColor;
  final EdgeInsetsGeometry? contentPadding;
  final String? hintText;
  final InputBorder? border;
  final InputBorder? enableBorder;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final String? Function(String?)? validator;
  final TextInputType? textInputType;
  final bool obsecureText;
  final AutovalidateMode? autovalidateMode;
  final String? errorText;
  final Function(String?)? onSaved;
  final bool? enable;
  final Color? fillColor;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enable,
      onSaved: onSaved,
      controller: controller,
      autovalidateMode: autovalidateMode,
      onChanged: onChanged,
      validator: validator,
      keyboardType: textInputType,
      obscureText: obsecureText,
      decoration: InputDecoration(
        fillColor: fillColor ?? Colors.white,
        errorText: errorText,
        hintText: hintText,
        hintStyle: const TextStyle(
            fontSize: 14,
            color: Colors.grey,
            fontWeight: FontWeight.w400),
        prefix: prefix,
        prefixIcon: prefixIcon,
        prefixIconColor: prefixIconColor,
        suffix: sufix,
        suffixIcon: sufixIcon,
        suffixIconColor: sufixIconColor,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        enabledBorder: enableBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        border: border ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
            // width: 2,
          ),
        ),
        focusedBorder: focusedBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.black,
            // width: 2,
          ),
        ),
        errorBorder: errorBorder ?? OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: Colors.red,
            // width: 2,
          ),
        ),
      ),
    );
  }
}