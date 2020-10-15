//Встреча с кабаном
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finggtu/views/stepSix.dart';

class StepFivePage extends StatefulWidget {
  @override
  _StepFivePageState createState() => _StepFivePageState();
}

class _StepFivePageState extends State<StepFivePage> {
  AudioPlayer advancedPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    loadSound();
  }

  Future loadSound() async {
    advancedPlayer = await AudioCache().play("audio/step6.ogg");
    advancedPlayer.onPlayerCompletion.listen((event) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StepSixPage()));
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
          Expanded(child: Image.asset("assets/kaban.png")),
          Expanded(child: Image.asset("assets/ogorod.png"))
        ],
      )
    ]));
  }
}
