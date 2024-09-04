import 'package:elevate_pesa/Global/colors.dart';
import 'package:flutter/material.dart';

class ExtendedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;
  final double buttonHeight;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;

  const ExtendedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    this.buttonHeight = 60,
    this.buttonColor = primaryColor,
    this.textColor = Colors.white,
    this.borderColor =
        primaryColor, // Default border color same as button color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100.0),
            side: BorderSide(color: borderColor), // Border color
          ),
          backgroundColor: buttonColor,
        ),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
    );
  }
}
