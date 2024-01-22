import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pages/signup_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void tosignuppage() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return SignUpPage();
    }));
  }

  String name = "";
  @override
  Widget build(BuildContext context) {
    final TextEditingController usercontroller = TextEditingController();
    final TextEditingController passcontroller = TextEditingController();
    final borderprops = OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)));
    return Scaffold(
        body: SafeArea(
            child: Container(
             decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 247, 145, 179),
            Colors.white,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),


              padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //Text("HI ${name}"),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Text(
            "LOGIN",
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: usercontroller,
            decoration: InputDecoration(
              fillColor: Color.fromRGBO(253, 198, 208, 100),
              filled: true,
              enabledBorder: borderprops,
              disabledBorder: borderprops,
              focusedBorder: borderprops,
              hintText: "Enter your username",
              prefixIcon: Icon(Icons.person),
            ),
            keyboardType: TextInputType.text,
          ),
          SizedBox(
            height: 20,
          ),
          TextField(
            controller: passcontroller,
            decoration: InputDecoration(
              fillColor: Color.fromRGBO(253, 198, 208, 100),
              filled: true,
              enabledBorder: borderprops,
              disabledBorder: borderprops,
              focusedBorder: borderprops,
              hintText: "Enter your password",
              prefixIcon: Icon(Icons.lock),
            ),
            keyboardType: TextInputType.text,
            obscureText: true,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                name = usercontroller.text;
              });
            },
            child: Text("Login",style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
            ),
          ),
          const SizedBox(height: 24),
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              "Don't have an account?",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            GestureDetector(
              onTap: tosignuppage,
              child: Text(
                "Signup now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            )
          ])
        ],
      ),
    )));
  }
}
