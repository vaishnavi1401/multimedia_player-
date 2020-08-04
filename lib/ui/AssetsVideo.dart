import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

VideoPlayerController videoPlayerController;
Future<void> initializePlayer;

class AssetsVideo extends StatelessWidget {
  build(BuildContext b) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  build(BuildContext b) {
    return Column(
      children: <Widget>[
        FutureBuilder(
            future: initializePlayer,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(child: VideoPlayer(videoPlayerController)),
                );
              } else {
                return AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.black,
                  ),
                );
              }
            }),
        Container(
          padding: EdgeInsets.only(bottom: 10),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 50,
              child: IconButton(
                icon: Icon(Icons.play_arrow),
                color: Colors.white,
                onPressed: () {
                  setState(() {});
                  videoPlayerController =
                      VideoPlayerController.asset('assets/Lesson1.mp4');
                  initializePlayer = videoPlayerController.initialize();
                  videoPlayerController.setVolume(1.0);
                  videoPlayerController.play();
                },
              ),
            ),
            Container(
              height: 50,
              child: IconButton(
                icon: Icon(Icons.pause),
                color: Colors.white,
                onPressed: () {
                  videoPlayerController.pause();
                },
              ),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.only(bottom: 10),
        ),
      ],
    );
  }
}
