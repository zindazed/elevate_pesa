import 'package:elevate_pesa/Global/colors.dart';
import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Info'),
        backgroundColor: primaryColor,
        foregroundColor: secondColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage(
                    'https://example.com/profile_image.jpg',
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Melissa Peters',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Email',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'melpeters@gmail.com',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Password',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                readOnly: true,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: '••••••••••',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Date of Birth',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: '23/05/1995',
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Country/Region',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Nigeria',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
