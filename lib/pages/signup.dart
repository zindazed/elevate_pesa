import 'package:elevate_pesa/components/extentedButton.dart';
import 'package:elevate_pesa/main.dart';
import 'package:elevate_pesa/pages/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Global/colors.dart';
import '../components/textInputField.dart';

class SignUpScreen extends StatefulWidget {
  final bool appbar;
  SignUpScreen({super.key, required this.appbar});
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  String name = "";
  String email = "";
  String password = "";
  String gender = "";
  String age = "";

  String? _selectedGender;
  final _formKey = GlobalKey<FormState>();
  bool _agreeToTerms = false;
  bool _isObscure = true;

  DateTime? datePicked;

  _showDateTimePicker() {
    // Get the current date
    final currentDate = DateTime.now();
    final minimumDate = DateTime(1930, 1, 1);

    // Set initial value and date to the current date
    datePicked = currentDate;

    // Format the date and set the text of the controller
    _dobController.text = DateFormat('MMM d, yyyy').format(currentDate);

    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200.0,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: CupertinoDatePicker(
            initialDateTime: currentDate,
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                datePicked = newDate;

                _dobController.text = DateFormat('MMM d, yyyy').format(newDate);
              });
            },
            mode: CupertinoDatePickerMode.date,
            minimumDate: minimumDate,
            maximumDate: DateTime.now(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (widget.appbar)
          ? AppBar(
              title: const Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 22.0, // Adjust the font size as needed
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
              backgroundColor: Colors.transparent,
              foregroundColor: Colors.black,
              elevation: 0,
              // leading: IconButton(onPressed: onPressed, icon: icon),
            )
          : null,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const SizedBox(height: 40.0),
                CustomTextInput(
                  controller: _nameController,
                  labelText: 'Name',
                  keyboardType: TextInputType.name,
                  prefixIcon: Icons.person_outlined,
                ),
                const SizedBox(height: 20.0),
                CustomTextInput(
                  controller: _emailController,
                  labelText: 'Email',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icons.email_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!value.contains('@') || !value.contains('.')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                CustomTextInput(
                  controller: _contactController,
                  keyboardType: TextInputType.phone,
                  labelText: 'Contact',
                  prefixIcon: Icons.phone_in_talk_outlined,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your contact';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    filled: true,
                    fillColor: Colors.grey[100],
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey[300]!,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: primaryColor,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.person_3_outlined),
                  ),
                  value: _selectedGender,
                  onChanged: (newValue) {
                    setState(() {
                      _selectedGender = newValue;
                    });
                  },
                  items: <String>['Male', 'Female']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                CustomTextInput(
                  onTap: _showDateTimePicker,
                  controller: _dobController,
                  keyboardType: TextInputType.text,
                  labelText: 'DOB',
                  prefixIcon: Icons.calendar_month_outlined,
                  // validator: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return 'Please enter your age';
                  //   } else if (int.tryParse(value) == null) {
                  //     return 'Age must be a number';
                  //   }
                  //   return null;
                  // },
                ),
                const SizedBox(height: 20.0),
                CustomTextInput(
                  controller: _passwordController,
                  keyboardType: TextInputType.text,
                  labelText: 'Password',
                  prefixIcon: Icons.lock_outlined,
                  isObscure: _isObscure,
                  isObscureToggle: () {
                    setState(() {
                      _isObscure = !_isObscure;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),

                Row(
                  children: [
                    Transform.scale(
                      scale: 1.2,
                      child: Checkbox(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)),
                        value: _agreeToTerms,
                        onChanged: (newValue) {
                          setState(() {
                            _agreeToTerms = newValue ?? false;
                          });
                        },
                      ),
                    ),
                    Flexible(
                      child: RichText(
                        overflow: TextOverflow.visible,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the healthcare ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Terms of Service',
                              style: TextStyle(color: primaryColor),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                            TextSpan(
                              text: ' and ',
                              style: TextStyle(color: Colors.black),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: TextStyle(color: primaryColor),
                              recognizer: TapGestureRecognizer()..onTap = () {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                ExtendedButton(
                  onPressed: () async {
                    // Create UserModel object
                    if (_formKey.currentState!.validate() && _agreeToTerms) {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      // prefs.setBool('isLoggedIn', true);
                      prefs.setString("user", _emailController.text);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    } else if (!_agreeToTerms) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Please agree to the terms of service and privacy policy'),
                        ),
                      );
                    }
                  },
                  buttonText: "Sign Up",
                ),
                const SizedBox(height: 10.0),
                Center(
                  child: RichText(
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Have an account? ',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
