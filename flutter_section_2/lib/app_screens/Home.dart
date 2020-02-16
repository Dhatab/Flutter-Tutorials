import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.deepOrange,
            padding: EdgeInsets.only(left: 10, top: 50),
//          width: 200,
//          height: 100,
//          margin: EdgeInsets.only(left: 15, top: 50),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Widget 1",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 25,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      textDirection: TextDirection.ltr,
                    )),
                    Expanded(
                        child: Text(
                      "Widget 2",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 35,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      textDirection: TextDirection.ltr,
                    )),
                    Expanded(
                        child: Text(
                      "Widget 3",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 50,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      textDirection: TextDirection.ltr,
                    ))
                  ],
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                        child: Text(
                      "Widget 1",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 25,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      textDirection: TextDirection.ltr,
                    )),
                    Expanded(
                        child: Text(
                      "Widget 2",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 35,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      textDirection: TextDirection.ltr,
                    )),
                    Expanded(
                        child: Text(
                      "Widget 3",
                      style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 50,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: Colors.white),
                      textDirection: TextDirection.ltr,
                    ))
                  ],
                ),
                ImageAsset(),
                TestRaisedButton()
              ],
            )));
  }
}

class ImageAsset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage assetImage = AssetImage('images/icon.png');
    Image image = Image(image: assetImage, width: 150, height: 150);
    return Container(child: image);
  }
}

class TestRaisedButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        width: 250,
        height: 50,
        child: RaisedButton(
          color: Colors.deepPurple,
          child: Text(
            "Button",
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w700,
                color: Colors.white),
          ),
          elevation: 6.0,
          onPressed: () => newMethod(context)
        ));
  }
}

void newMethod(BuildContext context) {
  var alertDialog = AlertDialog(
    title: Text("You have clicked on the button"),
    content: Text("button clicked"),
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      });
}
