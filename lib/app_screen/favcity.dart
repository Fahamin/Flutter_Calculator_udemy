import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavoriteCity extends StatefulWidget {
  const FavoriteCity({Key? key}) : super(key: key);

  @override
  _FavoriteCityState createState() => _FavoriteCityState();
}

class _FavoriteCityState extends State<FavoriteCity> {

  String nameCity = "";
  var _currency =<String> ["taka", "USD", "AUD", "OTHERS"];
  var _currentItem = "taka";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateful app Test"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (String userInput) {
                setState(() {
                  nameCity = userInput;
                });
              },
            ),
            DropdownButton<String>(
              value: _currentItem,
              icon: Icon(Icons.arrow_drop_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.red, fontSize: 18),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (  data) {
                setState(() {
                  _currentItem = data!;
                });
              },
              items: _currency.map<DropdownMenuItem<String>>((String value){
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),

            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text(
                "Name OF city $nameCity",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Text('Selected Item = ' + '$_currentItem',
                style: TextStyle
                  (fontSize: 22,
                    color: Colors.black)),
          ],
        ),
      ),
    );
  }
}
