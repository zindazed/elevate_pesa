import 'package:flutter/material.dart';

void popUp({
  required BuildContext context,
  IconData icon = Icons.check_box,
  Color bColor = Colors.green,
  Color tColor = Colors.white,
  required String message,
}) {
  final double bottomMargin = MediaQuery.of(context).size.height - 120;

  SnackBar snackBar = SnackBar(
    duration: Duration(milliseconds: 1500),
    content: Row(
      children: [
        Icon(
          icon,
          color: tColor,
          size: 20,
        ),
        SizedBox(width: 10),
        Text(
          message,
          style: TextStyle(color: tColor),
        ),
      ],
    ),
    backgroundColor: bColor,
    dismissDirection: DismissDirection.horizontal,
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.only(bottom: bottomMargin, left: 10, right: 10),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
