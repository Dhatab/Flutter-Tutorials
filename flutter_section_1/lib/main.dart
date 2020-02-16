import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Flutter App 1",
        home: Scaffold(
          appBar: AppBar(
            title: Text("My Flutter App"),
            centerTitle: true,
            backgroundColor: Colors.black,),
          body: FirstScreen()
        )
    );
  }
}