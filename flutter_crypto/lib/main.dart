import 'package:flutter/material.dart';
import 'package:flutter_crypto/home_page.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() async {
  List currencies = await getCurrencies();
  print(currencies);
  runApp(new MyApp(currencies));
}

class MyApp extends StatelessWidget{
  final List _currencies;
  MyApp(this._currencies);
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        theme: ThemeData(primarySwatch: Colors.pink),
    home: HomePage(_currencies),
    );
  }
}



Future<List> getCurrencies() async {
  String cryptoURL = "https://api.coinmarketcap.com/v1/ticker/?limit=50";
  http.Response response = await http.get(cryptoURL);
  return jsonDecode(response.body);
}


