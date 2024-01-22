import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  void tologinpage(){
    Navigator.of(context).pop();
    }

  @override
  Widget build(BuildContext context) {
    final TextEditingController usercontroller = TextEditingController();
    final TextEditingController emailcontroller= TextEditingController();
    final TextEditingController passcontroller = TextEditingController();
    final borderprops =
        OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(30)));
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: tologinpage, icon: Icon(Icons.arrow_back)),
        ),
        body: SafeArea(
            child: Container(
                        decoration: BoxDecoration(
    image: DecorationImage(
      image: AssetImage('assets/background_sakhi.png'),
      fit: BoxFit.cover, // Adjust scaling and positioning
    ),
  ),
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(
            child: Container(),
            flex: 2,
          ),
          Text(
            "SIGN UP",
            style: TextStyle(
                fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
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
            controller: emailcontroller,
            decoration: InputDecoration(
              fillColor: Color.fromRGBO(253, 198, 208, 100),
              filled: true,
              enabledBorder: borderprops,
              disabledBorder: borderprops,
              focusedBorder: borderprops,
              hintText: "Enter your email address",
              prefixIcon: Icon(Icons.email),
            ),
            keyboardType: TextInputType.emailAddress,
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
          ElevatedButton(onPressed: (){
          }, child: Text("Sign Up",style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),),
          style: ElevatedButton.styleFrom(
            backgroundColor:Colors.white,
            shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20))
            ) ,
          ),),
          const SizedBox(height:24),
            Flexible(
              child: Container(),
              flex: 2,
            ),
        ]
      ),
    )));
  }
}