import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pages/first_page.dart';
import 'package:flutter_pages/home_page.dart';
import 'package:flutter_pages/login_page.dart';
import 'package:flutter_pages/main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    checkUserAuthentication();
    }
    
    void checkUserAuthentication() async {
    // Replace this logic with your actual authentication check
    // For example, check a shared preference, a token, etc.
    bool isUserLoggedIn = await Future.delayed(Duration(seconds: 2), () {
      return false; // Placeholder, assuming the user is not logged in
    });

    if (isUserLoggedIn) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstPage()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Color
          Container(
            color: Color.fromRGBO(255, 221, 230, 1.0),
          ),
          // Image
          Center(
            child: Image.asset(
              'assets/sakhi_cropped_circle.png',
              width: 400,
              height: 400,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }


}
