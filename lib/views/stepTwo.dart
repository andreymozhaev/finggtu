//Бабушка
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finggtu/views/stepThree.dart';

class StepTwoPage extends StatefulWidget {
  @override
  _StepTwoPageState createState() => _StepTwoPageState();
}

class _StepTwoPageState extends State<StepTwoPage> {
  AudioPlayer advancedPlayer = AudioPlayer();
  bool isPig = false;

  @override
  void initState() {
    super.initState();
    loadSound1();
  }

  Future loadSound1() async {
    advancedPlayer = await AudioCache().play("audio/step2.ogg");
    advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        isPig = true;
        loadSound2();
      });
    });
  }

  Future loadSound2() async {
    advancedPlayer = await AudioCache().play("audio/step3.ogg");
    advancedPlayer.onPlayerCompletion.listen((event) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StepThreePage()));
    });
  }

  @override
  void dispose() {
    advancedPlayer = null;
    super.dispose();
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
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(child: Image.asset("assets/baba.jpg")),
          isPig ? Expanded(child: Image.asset("assets/pig.png")) : Container()
        ],
      )
    ]));
  }
}
