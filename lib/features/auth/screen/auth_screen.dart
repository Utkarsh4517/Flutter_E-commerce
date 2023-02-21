import 'dart:ffi';

import 'package:ecommerce_clone/common/widgets/custom_button.dart';
import 'package:ecommerce_clone/common/widgets/custom_textfield.dart';
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
  Auth _auth = Auth.signup;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signIpFormKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose(){
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
   // Navigator.pushNamed(context, '');
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Welcome', style: TextStyle(
                  fontSize: 22, fontWeight: FontWeight.w500
                ),
              ),
              // RADIO BUTTON TO CREATE NEW ACCOUNT
              ListTile(

                tileColor: _auth == Auth.signup ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundColor ,
                title: const Text(
                  'Create Account', style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup , // when ever we click up this radio button we want enum to set the value to signup
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  }
                ),
              ),
              if(_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8.0), color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                
                        CustomTextField(controller: _nameController, hintText:'Name' ,),
                        const SizedBox(height: 10,),
                        CustomTextField(controller: _emailController, hintText:'Email' ,),
                        const SizedBox(height: 10,),
                        CustomTextField(controller: _passwordController, hintText:'Password' ,),
                        const SizedBox(height: 10,),
                        CustomButton(text: 'Sign Up', onTap: (){

                        },)
                      ],
                    ),
                    ),
                ),
                ListTile(
               tileColor: _auth == Auth.signin ? GlobalVariables.backgroundColor : GlobalVariables.greyBackgroundColor ,
                title: const Text(
                  'Sign-In.', style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin , // when ever we click up this radio button we want enum to set the value to signup
                  groupValue: _auth,
                  onChanged: (Auth? val){
                    setState(() {
                      _auth = val!;
                    });
                  }
                ),
              ),
              if (_auth == Auth.signin)
               Container(
                  padding: const EdgeInsets.all(8.0), color: GlobalVariables.backgroundColor,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                
                        
                        CustomTextField(controller: _emailController, hintText:'Email' ,),
                        const SizedBox(height: 10,),
                        CustomTextField(controller: _passwordController, hintText:'Password' ,),
                        const SizedBox(height: 10,),
                        CustomButton(text: 'Sign In', onTap: (){

                        },)
                      ],
                    ),
                    ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}