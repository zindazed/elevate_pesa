import 'package:elevate_pesa/Global/colors.dart';
import 'package:flutter/material.dart';

class FeatureNotReadyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Feature Not Ready',
          style: TextStyle(
            fontSize: 22.0, // Adjust the font size as needed
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        foregroundColor: secondColor,
        elevation: 0,
        toolbarHeight: kToolbarHeight,
        // leading: IconButton(onPressed: onPressed, icon: icon),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.hourglass_empty,
              size: 100,
              color: Colors.grey,
            ),
            SizedBox(height: 20),
            Text(
              'This feature is not ready yet.',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Please check back later.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
