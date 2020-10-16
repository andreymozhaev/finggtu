//Финальная сцена
import 'dart:io';

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
  bool flag = false;

  @override
  void initState() {
    super.initState();
    loadSound();
  }

  Future loadSound() async {
    advancedPlayer = await AudioCache().play("audio/step9.ogg");
    advancedPlayer.onPlayerCompletion.listen((event) {
      setState(() {
        flag = true;
      });
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
      Center(
          child: flag?GestureDetector(
        onTap: () {
          exit(0);
        },
        child: Image.asset("assets/gamebutton.png"),
      ):Image.asset("assets/cat.png"))
    ]));
  }
}
