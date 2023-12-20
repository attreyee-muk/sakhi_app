import 'package:flutter/material.dart';
import 'package:flutter_pages/chatbot.dart';
import 'package:flutter_pages/doctor_info.dart';
import 'package:flutter_pages/faqs.dart';

void main() {
  runApp(const InsightsPage());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentPage=0;
  List<Widget> pages=[
    const DoctorInfo(),
    const ChatBot(),
    const InsightsPage(),
    ];
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
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
              
              Image.asset(
                'assets/clean-medical-background/v870-tang-36.jpg',
                //height: ,
                width: double.infinity,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Chip(label: Text("Something")),
                  Chip(label: Text("Something")),
                ],
              ),
            ]),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // currentIndex: currentPage,
          // onTap: (value){
          //   setState(() {
          //     currentPage=value;
          //     print(currentPage);
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context){
          //     return pages[currentPage];
          //   }));
          //   });
          // },
          items:  [
            const BottomNavigationBarItem(
            icon: Icon(Icons.medical_information),
            label:"Doctor's info"),
            const BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label:"Chatbot"),
            BottomNavigationBarItem(icon: IconButton(icon:const Icon(Icons.info),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return const InsightsPage();
              }));
            }),
            label: "Insights")
            ],
        ),
      ),
    );
  }
}
