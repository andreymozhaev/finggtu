//Задание с банкоматом
import 'package:flutter/material.dart';
import 'package:finggtu/views/endPage.dart';

class StepTenPage extends StatefulWidget {
  @override
  _StepTenPageState createState() => _StepTenPageState();
}

class _StepTenPageState extends State<StepTenPage> {
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
              MaterialPageRoute(builder: (context) => EndPage()));
        },
        child: Image.asset("assets/gamebutton.png"),
      ))
    ]));
  }
}
