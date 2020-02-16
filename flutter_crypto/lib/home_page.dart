import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


class HomePage extends StatefulWidget {
  final List currencies;

  HomePage(this.currencies);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List currencies;
  final List<MaterialColor> _colors = [Colors.blue, Colors.indigo, Colors.red];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crypto App"),
      ),
      body: _cryptoWidget(),
    );
  }

  Widget _cryptoWidget() {
    return Container(
      child: ListView.builder(
        itemCount: widget.currencies.length,
        itemBuilder: (BuildContext context, int index) {
          final Map currency = widget.currencies[index];
          final MaterialColor materialColor = _colors[index % _colors.length];

          return _getListItemUI(currency, materialColor);
        },
      ),
    );
  }

  ListTile _getListItemUI(Map currency, MaterialColor materialColor) {
    return ListTile(
      leading: new CircleAvatar(
        backgroundColor: materialColor,
        child: Text(currency['name'][0]),
      ),
      title: Text(currency['name'],
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: _getSubtitleText(
          currency['price_usd'], currency['percent_change_1h']),
      isThreeLine: true,
    );
  }

  Widget _getSubtitleText(String price_usd, String percentage_change_1h) {
    TextSpan priceTextWidget = new TextSpan(
        text: "\$$price_usd\n",
        style: TextStyle(color: Colors.black));

    String percentageChangeText = "1 Hour Change: $percentage_change_1h%";
    TextSpan percentageChangeTextWidget;

    if (double.parse(percentage_change_1h) > 0) {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: TextStyle(color: Colors.green));
    } else {
      percentageChangeTextWidget = new TextSpan(
          text: percentageChangeText,
          style: TextStyle(color: Colors.red));
    }
    return RichText(
      text: TextSpan(
          children: [priceTextWidget, percentageChangeTextWidget]
      ),
    );
  }
}
