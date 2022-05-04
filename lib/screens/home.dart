import 'package:flutter/material.dart';
import '../widgets/leftBar.dart';
import '../widgets/rightBar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _height = TextEditingController();
  TextEditingController _weight = TextEditingController();
  double bmiResult = 0;
  String textResult = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          elevation: 0,
          centerTitle: true,
          title: Text("BMI Calculator",
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 35,
                color: Theme.of(context).accentColor,
              ))),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 140,
                  child: TextField(
                    controller: _height,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Height/m",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        )),
                  ),
                ),
                Container(
                  width: 110,
                  child: TextField(
                    controller: _weight,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "Weight/kg",
                        border: InputBorder.none,
                        labelStyle: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        )),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_height.text);
                double _w = double.parse(_weight.text);

                setState(() {
                  bmiResult = _w / (_h * _h);
                  if (bmiResult > 25) {
                    textResult = "You are over weight.";
                  } else if (bmiResult <= 25 && bmiResult >= 18) {
                    textResult = "You have normal weight.";
                  } else {
                    textResult = "You are under weight.";
                  }
                });
              },
              child: Container(
                child: Text("Calculate",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).accentColor,
                    )),
              ),
            ),
            SizedBox(height: 150),
            Container(
              height: 150,
              child: Visibility(
                visible: textResult.isNotEmpty,
                child: Column(
                  children: [
                    Text(bmiResult.toStringAsFixed(2),
                        style: TextStyle(
                          fontSize: 45,
                          color: Theme.of(context).accentColor,
                        )),
                    SizedBox(height: 15),
                    Text(textResult,
                        style: TextStyle(
                          fontSize: 30,
                          color: Theme.of(context).accentColor,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}