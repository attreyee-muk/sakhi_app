import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pages/Messages.dart';
import 'package:flutter_pages/chatbot_ui.dart';
import 'package:flutter_pages/doctor_info.dart';
import 'package:flutter_pages/faqs.dart';
import 'package:flutter_pages/home_page.dart';

import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:flutter_pages/splash_screen.dart';
import 'package:flutter_pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,         
      ),
      debugShowCheckedModeBanner: false,
      home : SplashScreen(),
      // home: 
    );
  }
}










