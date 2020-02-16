import 'package:flutter/material.dart';

void main(){

  runApp(
    MaterialApp(
      title: "Stateful App Example",
      home: FavoriteCity(),
    )
  );
}

class FavoriteCity extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FavoriteCityState();
  }

}

class _FavoriteCityState extends State<FavoriteCity>{

  String nameCity = "";
  var _currencies = ['Dollar', 'Euro', 'Other'];
  var _currentItemSelected = 'Dollar';

  @override
  Widget build(BuildContext context) {
    debugPrint("set state is created");
    final TextEditingController _controller = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful App Ex"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(
                hintText: "Enter City Name Here"
              ),
              controller: _controller,
              onSubmitted: (String userInput) {
                setState(() {
                  debugPrint("set state is called");
                  nameCity = userInput;
                  _controller.clear();
                });
              },
            ),
            DropdownButton<String>(

              items: _currencies.map((String dropDownStringItem) {
                return DropdownMenuItem<String>(
                  value: dropDownStringItem,
                  child: Text(dropDownStringItem),
                );
            }).toList(),

              onChanged: (String newvalueSelected){
                //Code to execute when menu item is selected from drop down
                _dropDownItemSelected(newvalueSelected);
                },
              value: _currentItemSelected,

            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: Text(
              "Your Favorite City is $nameCity",
              style: TextStyle(fontSize: 20.0),
            )
            )],
        ),
      ),
    );
  }

  void _dropDownItemSelected(String newValueSelected){
    setState((){
      this._currentItemSelected = newValueSelected;
    });
  }

}

