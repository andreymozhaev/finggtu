//Задание от кабана
import 'package:flutter/material.dart';
import 'package:finggtu/views/stepSeven.dart';

class StepSixPage extends StatefulWidget {
  @override
  _StepSixPageState createState() => _StepSixPageState();
}

class _StepSixPageState extends State<StepSixPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned.fill(
          child: Image.asset(
        "assets/background.png",
        fit: BoxFit.cover,
        alignment: Alignment.topLeft,
      )),
      Center(
            child: GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => StepSevenPage()));
          },
          child: Image.asset("assets/gamebutton.png"),
        ))
    ]));
  }
}