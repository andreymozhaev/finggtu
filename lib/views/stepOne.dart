//Кот-промокот
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finggtu/views/stepTwo.dart';

class StepOnePage extends StatefulWidget {
  @override
  _StepOnePageState createState() => _StepOnePageState();
}

class _StepOnePageState extends State<StepOnePage> {
  
  AudioPlayer advancedPlayer = AudioPlayer();
  bool isSuccessful1 = false;
  bool isSuccessful2 = false;
  String data1 = "";
  String data2 = "";
  bool isPlay = true;
  @override
  void initState() {
    super.initState();
    loadSound();
  }

  Future loadSound() async {
    advancedPlayer = await AudioCache().play("audio/step1.ogg");
    advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        isPlay = false;
      });
    });
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
  }

  void next(bool flag1, bool flag2) {
    if (flag1 && flag2) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StepTwoPage()));
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
        !isPlay
            ? Column(
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
                              builder: (context, List<String> candidateData,
                                  rejectedData) {
                                return Center(
                                  child: isSuccessful1
                                      ? Container(
                                          color: Colors.yellow,
                                          height: 200.0,
                                          width: 200.0,
                                          child: Center(
                                              child: Image.asset(
                                                  "assets/" + data1 + ".png")),
                                        )
                                      : Container(
                                          height: 200.0,
                                          width: 200.0,
                                          color: Colors.yellow,
                                        ),
                                );
                              },
                              onWillAccept: (data) {
                                return true;
                              },
                              onAccept: (data) {
                                setState(() {
                                  if (!isPlay &&
                                      (data == "shoes" || data == "jacket")) {
                                    data1 = data;
                                    isSuccessful1 = true;
                                  } else
                                    isSuccessful1 = false;
                                });
                                next(isSuccessful1, isSuccessful2);
                              },
                            ),
                          ),
                          Expanded(
                            child: DragTarget(
                              builder: (context, List<String> candidateData,
                                  rejectedData) {
                                return Center(
                                  child: isSuccessful2
                                      ? Container(
                                          color: Colors.yellow,
                                          height: 200.0,
                                          width: 200.0,
                                          child: Center(
                                              child: Image.asset(
                                                  "assets/" + data2 + ".png")),
                                        )
                                      : Container(
                                          height: 200.0,
                                          width: 200.0,
                                          color: Colors.yellow,
                                        ),
                                );
                              },
                              onWillAccept: (data) {
                                return true;
                              },
                              onAccept: (data) {
                                setState(() {
                                  if (!isPlay &&
                                      (data == "shoes" || data == "jacket")) {
                                    data2 = data;
                                    isSuccessful2 = true;
                                  } else
                                    isSuccessful2 = false;
                                });
                                next(isSuccessful1, isSuccessful2);
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
                          Expanded(
                              child: Draggable(
                                  data: "tort",
                                  child: Image.asset('assets/tort.png'),
                                  feedback: Image.asset('assets/tort.png'))),
                          Expanded(
                              child: Draggable(
                                  data: "candy",
                                  child: Image.asset('assets/candy.png'),
                                  feedback: Image.asset('assets/candy.png'))),
                          Expanded(
                              child: Draggable(
                                  data: "shoes",
                                  child: Image.asset('assets/shoes.png'),
                                  feedback: Image.asset('assets/shoes.png'))),
                          Expanded(
                              child: Draggable(
                                  data: "matepad",
                                  child: Image.asset('assets/matepad.png'),
                                  feedback: Image.asset('assets/matepad.png'))),
                          Expanded(
                              child: Draggable(
                                  data: "jacket",
                                  child: Image.asset('assets/jacket.png'),
                                  feedback: Image.asset('assets/jacket.png')))
                        ],
                      ))
                ],
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [Expanded(child: Image.asset("assets/cat.png"))],
              )
      ]),
    );
  }
}
