import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PlayControls extends StatefulWidget {
  PlayControls({Key key}) : super(key: key);

  @override
  State<PlayControls> createState() => _PlayControlsState();
}

class _PlayControlsState extends State<PlayControls> {
  AudioPlayer audioPlayer = AudioPlayer();
  String audioAddress = 'assets/sound/Sia_-_Snowman_GoodLuckExpo.com.mp3';


  bool isPlaying = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconTheme(
        data: IconThemeData(
          color: Colors.white,
          size: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Feather.download,
              size: 24,
            ),
            Icon(
              Ionicons.ios_skip_backward,
              size: 32,
            ),
            GestureDetector(
              onTap: ()async{
               if(isPlaying){
                 pauseAudio();
               }else{
                 resumeAudio();
               }
              },
              child: Icon(
                isPlaying? MaterialCommunityIcons.pause_circle: Icons.play_arrow,
                size: 64,
              ),
            ),
            Icon(
              Ionicons.ios_skip_forward,
              size: 32,
            ),
            Icon(
              Feather.file_text,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  void resumeAudio()async{
    ByteData byteData = await rootBundle.load(audioAddress);
    Uint8List audiobytes = byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
    int result = await audioPlayer.resume();
    if(result == 1) {
      setState(() {
        isPlaying = true;
      });//play success

    }
  }

  void pauseAudio()async {
    int result = await audioPlayer.pause();
    if (result == 1) {
      setState(() {
        isPlaying=false;
      });
    }
  }
}
