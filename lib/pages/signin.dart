import 'package:elevate_pesa/components/extentedButton.dart';
import 'package:elevate_pesa/components/socialSignInButton.dart';
import 'package:elevate_pesa/main.dart';
import 'package:elevate_pesa/pages/signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../components/textInputField.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  String email = "";
  String password = "";

  String? _selectedGender;
  final _formKey = GlobalKey<FormState>();
  bool _isObscure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign In',
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
      ),
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
                    } else if (value.length < 8) {
                      return 'Password must be at least 8 characters long';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    RichText(
                      overflow: TextOverflow.visible,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Forgot password?',
                            style: TextStyle(
                                color: Colors.blue[700],
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()..onTap = () {},
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                ExtendedButton(
                    onPressed: () async {
                      // Create UserModel object
                      if (_formKey.currentState!.validate()) {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        // prefs.setBool('isLoggedIn', true);
                        prefs.setString("user", _emailController.text);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyHomePage()));
                      }
                    },
                    buttonText: "Sign In"),
                const SizedBox(height: 10.0),
                Center(
                  child: RichText(
                    overflow: TextOverflow.visible,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don\'t have an account? ',
                          style: TextStyle(color: Colors.black, fontSize: 17),
                        ),
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                              color: Colors.blue[700],
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpScreen(
                                          appbar: true,
                                        )),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Divider(
                      color: Colors
                          .grey[300], // Customize the color of the divider
                      thickness: 1.0, // Customize the thickness of the divider
                      height: 20.0, // Customize the height of the divider
                    ),
                    Container(
                      width: 35,
                      color: Colors.grey[100],
                      child: Center(
                        child: Text(
                          'OR',
                          style: TextStyle(
                            backgroundColor: Colors.grey[100],
                            fontSize: 18.0,
                            color: Colors.grey[500],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                SocialSignInButton(
                  text: 'Sign in with Google',
                  imagePath: 'assets/Google.png',
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {
                    // Google sign-in logic
                  },
                ),
                const SizedBox(height: 20.0),
                SocialSignInButton(
                  text: 'Sign in with Facebook',
                  imagePath: 'assets/Facebook.png',
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {
                    // Facebook sign-in logic
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
