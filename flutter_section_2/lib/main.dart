import 'package:flutter/material.dart';

import 'app_screens/Home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Exploring UI Widgets",
    home: Scaffold(
      appBar: AppBar(title: Text("Section 2"),),
      body: getLongListView() ,
      floatingActionButton: FloatingActionButton(
        onPressed: () => debugPrint("FAB Clicked"),
        child: Icon(Icons.add),
        tooltip: "Add one more item",

      ),
    ),
  ));
}

Widget getListView(){

  var listView = ListView(
    children: <Widget>[

      ListTile(
        leading: Icon(Icons.landscape),
        title : Text("Landscape"),
        subtitle: Text("Nice View!"),
        trailing: Icon(Icons.wb_sunny),
        onTap: () => debugPrint("Item tapped"),
      ),

      ListTile(
        leading: Icon(Icons.phone),
        title : Text("Phone"),
        subtitle: Text("Call me"),
        trailing: Icon(Icons.phone_android),
      ),

      ListTile(
        leading: Icon(Icons.gavel),
        title : Text("whatever"),
      ),

      Text("Another item", textAlign: TextAlign.center,),

      Container(
        color: Colors.deepPurple,
        child: ListTile(
          leading: Icon(Icons.speaker_notes_off),
          title : Text("whatever", style: TextStyle(
            color: Colors.white
          ),),
        ),
      )

    ],
  );
  return listView;
}



List<String> getListElements(){

  var items = List<String>.generate(20, (counter) => "Item $counter");
   return items;
}

Widget getLongListView(){

  var listItems = getListElements();

  var listview = ListView.builder(
      itemBuilder: (context, index){

        return ListTile(
          leading: Icon(Icons.chevron_right),
          title: Text(listItems[index]),
          onTap: () => showSnackBar(context, listItems[index]),
        );
      }
  );

  return listview;
}

void showSnackBar(BuildContext context, String item){
  var snackBar = SnackBar(
    content: Text("You just tapped $item"),
    action: SnackBarAction(label: "UNDO", onPressed: () => debugPrint("Dummy")),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}
