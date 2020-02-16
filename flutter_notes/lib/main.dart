import 'package:flutter/material.dart';
import 'package:flutter_notes/screens/note_list.dart';
import 'package:flutter_notes/screens/note_detail.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'NoteKeeper',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: NoteList(),
    );
  }
}