import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Back",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w100,
                          fontSize: 30),
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w100,
                          fontSize: 30),
                    ),
                    Expanded(
                      child: Text(
                        "306 pm ok ",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w100,
                            fontSize: 30),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Back",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w100,
                          fontSize: 30),
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w100,
                          fontSize: 30),
                      textDirection: TextDirection.ltr,
                    ),
                    Expanded(
                      child: Text(
                        "6 p30m ok ",
                        style: TextStyle(
                            color: Colors.green,
                            fontWeight: FontWeight.w100,
                            fontSize: 30),
                        textDirection: TextDirection.ltr,
                      ),
                    )
                  ],
                ),
                ButtonTest()
              ],
            )));
  }
}

class ButtonTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        onPressed: () => _dialog(context),
        color: Colors.green,
        child: Text("Click Here"),
        elevation: 7,
      ),
    );
  }

  void _dialog(BuildContext context) {
    var alertDialog = AlertDialog(
      title: Text(" SHow Dialog HERE"),
      content: Text("Just Wow"),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) => alertDialog
        );
  }
}
