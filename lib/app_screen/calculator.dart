import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorTest extends StatefulWidget {
  const CalculatorTest({Key? key}) : super(key: key);

  @override
  _CalculatorTestState createState() => _CalculatorTestState();
}

class _CalculatorTestState extends State<CalculatorTest> {
  //formkey for Form
  var _formKey = GlobalKey<FormState>();
  final minimumPadding = 5.0;
  var _currency = <String>["taka", "USD", "AUD", "OTHERS"];
  var _currentItem = "taka";
  var displayResult = 'wow';

// controler use get input from user
  TextEditingController principalControlled = TextEditingController();
  TextEditingController roiControlled = TextEditingController();
  TextEditingController termControlled = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //for change test style from same as actionbar
    TextStyle? textStyle = Theme.of(context).textTheme.subtitle1;
    return Scaffold(
      //for overflow remove
      //  resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Calculator Test"),
      ),
      //use Form against Container for validator
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.all(minimumPadding * 2),
          child: ListView(
            children: [
              getAssetImage(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                //use TextFromField for validator
                child: TextFormField(
                  style: textStyle,
                  controller: principalControlled,
                  keyboardType: TextInputType.number,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'please Enter principal Amount';
                    }
                  },
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      labelStyle: textStyle,
                      hintText: 'Enter principal e.g 1200',
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  controller: roiControlled,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return "please enter Rate of Interest";
                    }
                  },
                  decoration: InputDecoration(
                      labelStyle: textStyle,
                      labelText: 'Rate of Interest',
                      hintText: 'IN Percentence',
                      errorStyle: TextStyle(
                        color: Colors.yellowAccent,
                        fontSize: 15.0,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    //expanded use for come to page else this widget show out of page
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        style: textStyle,
                        controller: termControlled,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "please enter TIME OF YEARS";
                          }
                        },
                        decoration: InputDecoration(
                            labelText: 'Term',
                            hintText: 'Time in Years',
                            labelStyle: textStyle,
                            errorStyle: TextStyle(
                              color: Colors.yellowAccent,
                              fontSize: 15.0,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0))),
                      ),
                    ),
                    //for marzine two elements use container
                    Container(
                      width: minimumPadding * 5,
                    ),
                    Expanded(
                      child: DropdownButton<String>(
                        value: _currentItem,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        elevation: 16,
                        style: TextStyle(color: Colors.red, fontSize: 18),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (data) {
                          setState(() {
                            _currentItem = data!;
                          });
                        },
                        items: _currency
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColorDark,
                            child: Text(
                              "Calculate",
                              //increase text size 50 percent
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () => setState(() {
                                  // this section for validator
                                  if (_formKey.currentState!.validate()) {
                                    this.displayResult =
                                        _calculateTotalReturns();
                                  }
                                  // this.displayResult = "non";
                                }))),
                    Expanded(
                        child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              "Reset",
                              //increase text size 50 percent
                              textScaleFactor: 1.5,
                            ),
                            onPressed: () {
                              setState(() {
                                _resetallData();
                              });
                            }))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  this.displayResult,
                  style: textStyle,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget getAssetImage() {
    AssetImage assetImage = AssetImage("images/usd.jpg");
    Image image = Image(image: assetImage, width: 125.0, height: 125.0);
    return Container(
      child: image,
      margin: EdgeInsets.all(minimumPadding * 5),
    );
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalControlled.text);
    double roi = double.parse(roiControlled.text);
    double term = double.parse(termControlled.text);

    double totalAmountPayble = principal + (principal * roi * term) / 100;
    String result =
        "after $term years, your invest be worth $totalAmountPayble $_currentItem ";

    return result;
  }

  void _resetallData() {
    principalControlled.text = "";
    roiControlled.text = "";
    termControlled.text = "";
    displayResult = "";
    _currentItem = _currency[0];
  }
}
