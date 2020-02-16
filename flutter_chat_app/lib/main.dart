import 'package:flutter/material.dart';
import 'package:flutter_chat_app/Login.dart';
import 'package:flutter_chat_app/Registration.dart';
import 'package:flutter_chat_app/Chat.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Chat',
        theme: ThemeData.dark(),
        initialRoute: MyHomePage.id,
        routes: {
          MyHomePage.id: (context) => MyHomePage(),
          Registration.id: (context) => Registration(),
          Login.id: (context) => Login(),
          Chat.id: (context) => Chat(),
        });
  }
}

class MyHomePage extends StatelessWidget {
  static const String id = "HOMESCREEN";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset("assets/logo.png"),
                  height: 75.0,
                  width: 100.0,
                ),
              ),
              Text(
                "Chat App",
                style: TextStyle(fontSize: 40.0),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
          CustomButton(
            text: "LOG IN",
            callback: () {
              Navigator.of(context).pushNamed(Login.id);
            },
          ),
          CustomButton(
            text: "REGISTER",
            callback: () {
              Navigator.of(context).pushNamed(Registration.id);
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final VoidCallback callback;
  final String text;

  const CustomButton({Key key, this.callback, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      child: Material(
        child: ButtonTheme(
          minWidth: 200.0,
          height: 50.0,
          child: RaisedButton(
              color: Colors.white30,
              elevation: 6.0,
              child: Text(text, style: TextStyle(fontSize: 18.0),),
              onPressed: callback,
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0))),
        ),
      ),
    );
  }
}
