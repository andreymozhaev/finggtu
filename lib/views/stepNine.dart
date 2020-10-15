//Встреча со львом
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:finggtu/views/stepTen.dart';

class StepNinePage extends StatefulWidget {
  @override
  _StepNinePageState createState() => _StepNinePageState();
}

class _StepNinePageState extends State<StepNinePage> {

  AudioPlayer advancedPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    loadSound();
  }

  Future loadSound() async {
    advancedPlayer = await AudioCache().play("audio/step8.ogg");
    advancedPlayer.onPlayerCompletion.listen((event) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => StepTenPage()));
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
          Expanded(child: Image.asset("assets/lion.png")),
          Expanded(child: Image.asset("assets/atm.png"))
        ],
      )
    ]));
  }
}