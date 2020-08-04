import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

Future<void> initializePlayer;
VideoPlayerController videoPlayerController;

class NetworkVideo extends StatelessWidget {
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
              padding: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {});
                  videoPlayerController = VideoPlayerController.network(
                      "https://github.com/vaishnavi1401/media_player/blob/master/video.mp4?raw=true");
                  initializePlayer = videoPlayerController.initialize();
                  videoPlayerController.setVolume(1.0);
                  //videoPlayerController.initialize();
                  videoPlayerController.play();
                },
                child: Icon(Icons.play_arrow),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: FloatingActionButton(
                onPressed: () {
                  print("Network video Paused!");
                  videoPlayerController.pause();
                },
                child: Icon(Icons.pause),
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
