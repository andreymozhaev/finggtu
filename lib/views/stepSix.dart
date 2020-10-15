//Задание от кабана
import 'package:flutter/material.dart';
import 'package:finggtu/views/stepSeven.dart';

class StepSixPage extends StatefulWidget {
  @override
  _StepSixPageState createState() => _StepSixPageState();
}

class _StepSixPageState extends State<StepSixPage> {
  bool apple = false;
  bool cabbage = false;
  bool banan = false;
  bool orange = false;
  bool pepper = false;
  bool tomat = false;

  void next() {
    if (apple && cabbage && banan && orange && pepper && tomat) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StepSevenPage()));
    }
  }

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
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: DragTarget(
                      builder:
                          (context, List<String> candidateData, rejectedData) {
                        return Image.asset("assets/vegetables.png");
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(() {
                          if (data == "tomat") tomat = true;
                          if (data == "cabbage") cabbage = true;
                          if (data == "pepper") pepper = true;
                        });
                        next();
                      },
                    ),
                  ),
                  Expanded(
                    child: DragTarget(
                      builder:
                          (context, List<String> candidateData, rejectedData) {
                        return Image.asset("assets/fruits.png");
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(() {
                          if (data == "apple") apple = true;
                          if (data == "banan") banan = true;
                          if (data == "orange") orange = true;
                        });
                        next();
                      },
                    ),
                  ),
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  !apple
                      ? Expanded(
                          child: Draggable(
                              data: "apple",
                              child: Image.asset('assets/apple.png'),
                              feedback: Image.asset('assets/apple.png')))
                      : Container(
                          height: 100,
                          width: 100,
                        ),
                  !banan
                      ? Expanded(
                          child: Draggable(
                              data: "banan",
                              child: Image.asset('assets/banan.png'),
                              feedback: Image.asset('assets/banan.png')))
                      : Container(
                          height: 100,
                          width: 100,
                        ),
                  !cabbage
                      ? Expanded(
                          child: Draggable(
                              data: "cabbage",
                              child: Image.asset('assets/cabbage.png'),
                              feedback: Image.asset('assets/cabbage.png')))
                      : Container(
                          height: 100,
                          width: 100,
                        ),
                  !pepper
                      ? Expanded(
                          child: Draggable(
                              data: "pepper",
                              child: Image.asset('assets/pepper.png'),
                              feedback: Image.asset('assets/pepper.png')))
                      : Container(
                          height: 100,
                          width: 100,
                        ),
                  !tomat
                      ? Expanded(
                          child: Draggable(
                              data: "tomat",
                              child: Image.asset('assets/tomat.png'),
                              feedback: Image.asset('assets/tomat.png')))
                      : Container(
                          height: 100,
                          width: 100,
                        ),
                  !orange
                      ? Expanded(
                          child: Draggable(
                              data: "orange",
                              child: Image.asset('assets/orange.png'),
                              feedback: Image.asset('assets/orange.png')))
                      : Container(
                          height: 100,
                          width: 100,
                        )
                ],
              ))
        ],
      )
    ]));
  }
}
