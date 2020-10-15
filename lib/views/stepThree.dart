//Встреча с дятлом
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finggtu/views/stepFour.dart';

class StepThreePage extends StatefulWidget {
  @override
  _StepThreePageState createState() => _StepThreePageState();
}

class _StepThreePageState extends State<StepThreePage> {
  AudioPlayer advancedPlayer = AudioPlayer();

@override
  void initState() {
    super.initState();
    loadSound();
  }

  Future loadSound() async {
    advancedPlayer = await AudioCache().play("audio/step4.ogg");
    advancedPlayer.onPlayerCompletion.listen((event) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StepFourPage()));
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/bird.png")
        ],)
    ]));
  }
}
