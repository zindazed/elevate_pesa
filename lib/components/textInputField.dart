import 'package:elevate_pesa/Global/colors.dart';
import 'package:flutter/material.dart';

class CustomTextInput extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final bool filled;
  final bool isObscure;
  final Color fillColor;
  final Color enabledBorderColor;
  final Color focusedBorderColor;
  final BorderRadius borderRadius;
  final String? Function(String?)? validator;
  final String? Function()? isObscureToggle;
  final int? maxlines;
  final int? minlines;
  final Function()? onTap;

  const CustomTextInput(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.prefixIcon,
      this.maxlines = 1,
      this.minlines = 1,
      required this.keyboardType,
      this.filled = true,
      this.isObscure = false,
      this.fillColor = const Color(0xFFF5F5F5),
      this.enabledBorderColor = const Color(0xFFE0E0E0),
      this.focusedBorderColor = primaryColor,
      this.borderRadius = const BorderRadius.all(Radius.circular(10.0)),
      this.validator,
      this.isObscureToggle,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxlines,
      minLines: minlines,
      onTap: onTap,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: focusedBorderColor),
        hintText: 'Enter ${labelText.toLowerCase()}',
        prefixIcon: (prefixIcon != null) ? Icon(prefixIcon) : null,
        filled: filled,
        fillColor: fillColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: enabledBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: focusedBorderColor,
          ),
        ),
        suffixIcon: isObscureToggle != null
            ? IconButton(
                icon: Icon(
                  isObscure
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: Colors.grey[600],
                ),
                onPressed: isObscureToggle,
              )
            : null,
      ),
      validator: validator != null
          ? validator
          : (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter $labelText';
              }
              return null;
            },
    );
  }
}
