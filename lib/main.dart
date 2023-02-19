import 'package:ecommerce_clone/constants/global_var.dart';
import 'package:ecommerce_clone/features/auth/screen/auth_screen.dart';
import 'package:ecommerce_clone/router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-commerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: GlobalVariables.backgroundColor,
        // TO CHANGE THE COLOR OF BUTTONS
        colorScheme: const ColorScheme.light(
          primary: GlobalVariables.secondaryColor,

        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        )
      ),
      onGenerateRoute: (settings) =>  generateRoute(settings),
      home: const AuthScreen(),
    );
  }
}
