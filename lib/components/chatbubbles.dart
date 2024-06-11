import 'package:elevate_pesa/Global/colors.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({
    required this.message,
    required this.isUser,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bubbleColor = isUser ? primaryColor : Colors.grey[200]!;
    Color textColor = isUser ? Colors.white : Colors.black;

    return Align(
      alignment: isUser ? Alignment.topRight : Alignment.topLeft,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(isUser ? 24.0 : 0),
            topRight: Radius.circular(isUser ? 0 : 24.0),
            bottomLeft: Radius.circular(24.0),
            bottomRight: Radius.circular(24.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 4,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          message,
          style: TextStyle(
            color: textColor,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}
