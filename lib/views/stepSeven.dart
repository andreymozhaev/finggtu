//Встреча с совой
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finggtu/views/stepEight.dart';

class StepSevenPage extends StatefulWidget {
  @override
  _StepSevenPageState createState() => _StepSevenPageState();
}

class _StepSevenPageState extends State<StepSevenPage> {
  AudioPlayer advancedPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    loadSound();
  }

  Future loadSound() async {
    advancedPlayer = await AudioCache().play("audio/step7.ogg");
    advancedPlayer.onPlayerCompletion.listen((event) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StepEightPage()));
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
          Expanded(child: Image.asset("assets/sova.png")),
          Expanded(child: Image.asset("assets/car.png"))
        ],
      )
    ]));
  }
}
