import 'package:ecommerce_clone/constants/global_var.dart';
import 'package:flutter/material.dart';
 // enum is used to get the index of whether user is trying to sign in or sign up inside Listtile radio
enum Auth{
  signin,
  signup,
}

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
   // Navigator.pushNamed(context, '');
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Welcome', style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w500
                ),
              ),
              // RADIO BUTTON TO CREATE NEW ACCOUNT
              ListTile(
                title: const Text(
                  'Create Account', style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup , // when ever we click up this radio button we want enum to set the value to signup
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}