import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

// ignore: must_be_immutable
class AssetsAudio extends StatelessWidget {
  AudioPlayer advancedPlayer;
  build(BuildContext b) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/video.png'),
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(80.0),
                ),
              ),
              Container(
                height: 50,
                child: IconButton(
                  icon: Icon(Icons.play_arrow),
                  color: Colors.white,
                  onPressed: () async {
                    advancedPlayer =
                        await AudioCache().loop('assets/sample.wav');
                  },
                ),
              ),
              Container(
                height: 50,
                child: IconButton(
                  icon: Icon(Icons.pause),
                  color: Colors.white,
                  onPressed: () async {
                    await advancedPlayer.pause();
                  },
                ),
              ),
              Container(
                height: 50,
                child: IconButton(
                  icon: Icon(Icons.stop),
                  color: Colors.white,
                  onPressed: () async {
                    await advancedPlayer.stop();
                  },
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10),
          ),
        ],
      ),
    );
  }
}
