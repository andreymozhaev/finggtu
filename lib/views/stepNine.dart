//Встреча со львом
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finggtu/views/endPage.dart';

class StepNinePage extends StatefulWidget {
  @override
  _StepNinePageState createState() => _StepNinePageState();
}

class _StepNinePageState extends State<StepNinePage> {
  AudioPlayer advancedPlayer = AudioPlayer();
  bool step1 = false;
  bool step2 = false;
  bool step3 = false;
  bool step4 = false;
  bool step5 = false;
  bool step6 = false;

  @override
  void initState() {
    super.initState();
    loadSound();
  }

  Future loadSound() async {
    advancedPlayer = await AudioCache().play("audio/step8.ogg");
    advancedPlayer.onPlayerCompletion.listen((event) {});
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  void next() {
    if (step1 && step2 && step3 && step4) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => EndPage()));
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
                  Expanded(child: Image.asset("assets/lion.png")),
                  Expanded(
                    child: DragTarget(
                      builder:
                          (context, List<String> candidateData, rejectedData) {
                        return !step1
                            ? Container(
                                color: Colors.yellow,
                                margin: EdgeInsets.all(10),
                              )
                            : Image.asset("assets/apple.png");
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(() {
                          if (data == "step1") step1 = true;
                        });
                        next();
                      },
                    ),
                  ),
                  Expanded(
                    child: DragTarget(
                      builder:
                          (context, List<String> candidateData, rejectedData) {
                        return !step2
                            ? Container(
                                color: Colors.yellow,
                                margin: EdgeInsets.all(10),
                              )
                            : Image.asset("assets/banan.png");
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(() {
                          if (data == "step2") step2 = true;
                        });
                        next();
                      },
                    ),
                  ),
                  Expanded(
                    child: DragTarget(
                      builder:
                          (context, List<String> candidateData, rejectedData) {
                        return !step3
                            ? Container(
                                color: Colors.yellow,
                                margin: EdgeInsets.all(10),
                              )
                            : Image.asset("assets/tomat.png");
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(() {
                          if (data == "step3") step3 = true;
                        });
                        next();
                      },
                    ),
                  ),
                  Expanded(
                    child: DragTarget(
                      builder:
                          (context, List<String> candidateData, rejectedData) {
                        return !step4
                            ? Container(
                                color: Colors.yellow,
                                margin: EdgeInsets.all(10),
                              )
                            : Image.asset("assets/orange.png");
                      },
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(() {
                          if (data == "step4") step4 = true;
                        });
                        next();
                      },
                    ),
                  ),
                  Expanded(child: Image.asset("assets/atm.png"))
                ],
              )),
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      child: Draggable(
                          data: "step1",
                          child: Image.asset('assets/apple.png'),
                          feedback: Image.asset('assets/apple.png'))),
                  Expanded(
                      child: Draggable(
                          data: "step2",
                          child: Image.asset('assets/banan.png'),
                          feedback: Image.asset('assets/banan.png'))),
                  Expanded(
                      child: Draggable(
                          data: "step5",
                          child: Image.asset('assets/cabbage.png'),
                          feedback: Image.asset('assets/cabbage.png'))),
                  Expanded(
                      child: Draggable(
                          data: "step6",
                          child: Image.asset('assets/pepper.png'),
                          feedback: Image.asset('assets/pepper.png'))),
                  Expanded(
                      child: Draggable(
                          data: "step3",
                          child: Image.asset('assets/tomat.png'),
                          feedback: Image.asset('assets/tomat.png'))),
                  Expanded(
                      child: Draggable(
                          data: "step4",
                          child: Image.asset('assets/orange.png'),
                          feedback: Image.asset('assets/orange.png')))
                ],
              ))
        ],
      )
    ]));
  }
}
