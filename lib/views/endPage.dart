//Финальная сцена
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class EndPage extends StatefulWidget {
  @override
  _EndPageState createState() => _EndPageState();
}

class _EndPageState extends State<EndPage> {

  AudioPlayer advancedPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    loadSound();
  }

  Future loadSound() async {
    advancedPlayer = await AudioCache().play("audio/step9.ogg");
    advancedPlayer.onPlayerCompletion.listen((event) {
      /*Navigator.push(
          context, MaterialPageRoute(builder: (context) => StepEightPage()));*/
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
    ]));
  }
}