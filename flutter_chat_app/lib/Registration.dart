import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Chat.dart';
import 'package:flutter_chat_app/main.dart';

class Registration extends StatefulWidget {
  static const String id = "REGISTRATION";

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String email;
  String password;

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser() async {
    FirebaseUser user = await _auth.createUserWithEmailAndPassword(
        email: email.trim(), password: password);

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Chat(user: user,
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Hero(
              tag: "logo",
              child: Container(
                child: Image.asset("assets/logo.png",
                height: 100.0,
                width: 100.0,),
              ),
            ),
          Padding(
            padding: EdgeInsets.only(top:10.0, left: 5.0, right: 5.0),
            child: TextField(
              keyboardType:  TextInputType.emailAddress,
              onChanged: (value) => email = value,
              decoration: InputDecoration(
                hintText: "Enter Your Email",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top:10.0, left: 5.0, right: 5.0),
            child: TextField(
              autocorrect: false,
              obscureText: true,
              onChanged: (value) => password = value,
              decoration: InputDecoration(
                hintText: "Enter Your Password",
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          CustomButton(
            text: "REGISTER",
            callback: () async {
              await registerUser();
            },
          )
        ],
      ),
    );
  }
}
