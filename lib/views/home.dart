import 'package:finggtu/views/stepOne.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
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
                MaterialPageRoute(builder: (context) => StepOnePage()));
          },
          child: Image.asset("assets/gamebutton.png"),
        ))
      ]),
    );
  }
}
