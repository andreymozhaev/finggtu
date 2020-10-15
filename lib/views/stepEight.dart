//Задание от совы
import 'package:flutter/material.dart';
import 'package:finggtu/views/stepNine.dart';

class StepEightPage extends StatefulWidget {
  @override
  _StepEightPageState createState() => _StepEightPageState();
}

class _StepEightPageState extends State<StepEightPage> {
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
              MaterialPageRoute(builder: (context) => StepNinePage()));
        },
        child: Image.asset("assets/gamebutton.png"),
      ))
    ]));
  }
}
