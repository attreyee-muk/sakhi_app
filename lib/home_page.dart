import 'package:flutter/material.dart';

import 'main_tab/main_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          // Include the HeaderWidget
          AppHeader(),
          // Add other widgets below the header
          Expanded(
            child: Center(
              child: Text('Content'),
            ),
          ),
        ],
      ),
    );
  }
}