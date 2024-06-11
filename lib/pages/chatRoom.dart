import 'package:elevate_pesa/Global/colors.dart';
import 'package:elevate_pesa/components/chatbubbles.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ChatRoom extends StatefulWidget {
  const ChatRoom({
    Key? key,
  }) : super(key: key);

  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class Message {
  final String content;
  final String senderType;

  Message({
    required this.content,
    required this.senderType,
  });
}

class _ChatRoomState extends State<ChatRoom> {
  final TextEditingController _controller = TextEditingController();
  List<Message> messages = [
    Message(content: "Hello", senderType: "Client"),
    Message(
        content: "Hello! How can I help you today?", senderType: "Business"),
    Message(
        content: "I need assistance with my Investment.", senderType: "Client"),
    Message(
        content: "Sure, can you provide me with your Investment number?",
        senderType: "Business"),
    Message(content: "Yes, it's 123456.", senderType: "Client"),
    Message(
        content: "Thank you. Let me check the status for you.",
        senderType: "Business"),
    Message(content: "I appreciate your help.", senderType: "Client"),
    Message(
        content: "Your Investment was cancelled due to late payment.",
        senderType: "Business"),
    Message(
        content: "Ohh! Alright, lemme get another property then",
        senderType: "Client"),
    Message(content: "Alright, Have a good day", senderType: "Business"),
  ];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  void _sendMessage(String message) {
    setState(() {
      messages.add(Message(content: message, senderType: "Client"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Care"),
        backgroundColor: primaryColor,
        elevation: 0,
        foregroundColor: secondColor,
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // (isLoading)
          //     ? Expanded(
          //         child: Center(child: CircularProgressIndicator()),
          //       )
          // :
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = messages[messages.length - 1 - index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 4.0, horizontal: 8.0),
                  child: Align(
                    alignment: message.senderType == 'Client'
                        ? Alignment.topRight
                        : Alignment.topLeft,
                    child: ChatBubble(
                      message: message.content,
                      isUser: (message.senderType == 'Client'),
                    ),
                  ),
                );
              },
              reverse: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(32.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: TextField(
                        controller: _controller,
                        decoration: const InputDecoration(
                          hintText: 'Type a message',
                          border: InputBorder.none,
                        ),
                        onSubmitted: (value) {
                          _sendMessage(value);
                          _controller.clear();
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8.0),
                Material(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(32.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(32.0),
                    onTap: () {
                      String message = _controller.text.trim();
                      if (message.isNotEmpty) {
                        _sendMessage(message);
                        _controller.clear();
                      }
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: (isLoading)
                          ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
