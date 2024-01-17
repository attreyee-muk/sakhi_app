import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pages/Messages.dart';
import 'package:flutter_pages/chatbot_ui.dart';
import 'package:flutter_pages/doctor_info.dart';
import 'package:flutter_pages/faqs.dart';
import 'package:flutter_pages/home_page.dart';

import 'package:dialog_flowtter/dialog_flowtter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _page=0;
  late PageController pageController;
  final List messages=[];

  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }

  void pagechanged(int page){
    setState(() {
      _page=page;
    });
  }
  @override
  void initState() {
    super.initState();
    pageController=PageController();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final List<String> list1 = ["ChatBot", "Dashboard"];
    return MaterialApp(
      title: 'Home Page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,         
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.pink,
        appBar: AppBar(
          title: const Text("Home Page"),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [],
        ),
        drawer: Drawer(
          child: Column(
            children: [
              Container(
                height: 250,
                width: double.infinity,
                color: Colors.green,
                child: const Column(
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      //backgroundImage: NetworkImage(""),
                      radius: 60,
                    ),
                    Text(
                      "Hi <Username>",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: ((context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Chip(
                        label: Text(list1[index]),
                      ),
                    );
                  }),
                  itemCount: list1.length,
                  scrollDirection: Axis.vertical,
                ),
              )
            ],
          ),
        ),
        body: PageView(
          physics: NeverScrollableScrollPhysics(),
          children:  [
            HomePage(),
            Home(),
            InsightsPage()
          ],
          controller: pageController,
          onPageChanged: pagechanged,
        ),
        bottomNavigationBar: CupertinoTabBar(
          backgroundColor: Colors.red,
          items:  [
            BottomNavigationBarItem(
            icon: Icon(Icons.medical_information,
            color: _page==0?Colors.white:Colors.yellow
            ),
            ),
            BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble,
            color:_page==1?Colors.white:Colors.yellow,),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.info,
              color:_page==2?Colors.white:Colors.yellow,),
            ),
            ],
            onTap: navigationTapped,
        ),
      ),
    );
  }
}








