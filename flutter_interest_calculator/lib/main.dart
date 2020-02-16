import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Simple Interest Calculator",
    home: SIForm(),
    theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.orangeAccent,
        buttonColor: Colors.white),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  var _formKey = GlobalKey<FormState>();

  var _currencies = ['Dollars', 'Euro', 'Pesos'];
  final _minPadding = 5.0;

  var _currentItemSelected = '';
  var _displayText = "";

  @override
  void initState() {
    super.initState();
    _currentItemSelected = _currencies[0];
  }

  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;

    return Scaffold(
//      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Simple Interest Calculator'),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
            padding: EdgeInsets.all(_minPadding * 2),
            child: ListView(
              children: <Widget>[
                getImageAsset(),
                Padding(
                    padding:
                        EdgeInsets.only(top: _minPadding, bottom: _minPadding),
                    child: TextFormField(
                      controller: principalController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter %';
                        }
                        ;
                      },
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      decoration: InputDecoration(
                          labelText: "Principal",
                          hintText: "Enter Principal e.g. 12000",
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.yellowAccent, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(top: _minPadding, bottom: _minPadding),
                    child: TextFormField(
                      controller: roiController,
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter %';
                        }
                        ;
                      },
                      keyboardType: TextInputType.number,
                      style: textStyle,
                      decoration: InputDecoration(
                          labelText: "Rate of Interest",
                          hintText: "In Percent",
                          labelStyle: textStyle,
                          errorStyle: TextStyle(
                              color: Colors.yellowAccent, fontSize: 15.0),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(top: _minPadding, bottom: _minPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                            child: TextFormField(
                          controller: termController,
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Please enter %';
                            }
                            ;
                          },
                          keyboardType: TextInputType.number,
                          style: textStyle,
                          decoration: InputDecoration(
                              labelText: "Term",
                              hintText: "In Years",
                              labelStyle: textStyle,
                              errorStyle: TextStyle(
                                  color: Colors.yellowAccent, fontSize: 15.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        )),
                        Container(width: _minPadding * 5),
                        Expanded(
                            child: DropdownButton<String>(
                          style: textStyle,
                          items: _currencies.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          value: _currentItemSelected,
                          onChanged: (String newValueSelected) {
                            _onDropDownItemSelected(newValueSelected);
                          },
                        ))
                      ],
                    )),
                Padding(
                    padding:
                        EdgeInsets.only(top: _minPadding, bottom: _minPadding),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColor,
                            child: Text('Calculate', textScaleFactor: 1.5),
                            onPressed: () {
                              setState(() {
                                if (_formKey.currentState.validate()) {
                                  this._displayText = _calculateTotal();
                                }
                              });
                            },
                          ),
                        ),
                        Container(width: _minPadding * 5),
                        Expanded(
                          child: RaisedButton(
                            color: Theme.of(context).buttonColor,
                            textColor: Colors.black,
                            child: Text('Reset', textScaleFactor: 1.5),
                            onPressed: () {
                              setState(() {
                                _reset();
                              });
                            },
                          ),
                        )
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.all(_minPadding),
                  child: Text(
                    this._displayText,
                    style: textStyle,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(
      image: assetImage,
      height: 125.0,
      width: 125.0,
      color: Colors.green,
    );

    return Container(
        child: image, margin: EdgeInsets.all((_minPadding * 10.0)));
  }

  void _onDropDownItemSelected(String newValueSelected) {
    setState(() {
      this._currentItemSelected = newValueSelected;
    });
  }

  String _calculateTotal() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalAmount = principal + (principal * roi * term) / 100;

    String result =
        'After $term years, your investment will be worth $totalAmount $_currentItemSelected';
    return result;
  }

  void _reset() {
    principalController.clear();
    roiController.clear();
    termController.clear();
    _displayText = "";
    _currentItemSelected = _currencies[0];
  }
}
