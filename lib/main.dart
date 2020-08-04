import 'package:flutter/material.dart';
import 'ui/AssetsAudio.dart';
import 'ui/AssetsVideo.dart';
import 'ui/NetworkAudio.dart';
import 'ui/NetworkVideo.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  build(BuildContext b) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Media Player"),
            backgroundColor: Colors.blue,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.audiotrack),
                  text: "Audio",
                ),
                Tab(
                  icon: Icon(Icons.voicemail),
                  text: "Audio online ",
                ),
                Tab(
                  icon: Icon(Icons.videocam),
                  text: "Video",
                ),
                Tab(
                  icon: Icon(Icons.music_video),
                  text: "Video online",
                ),
              ],
            ),
          ),
          body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  stops: [.3, .9],
                  colors: [Colors.blue, Colors.cyanAccent]),
            ),
            child: TabBarView(
              children: [
                AssetsAudio(),
                NetworkAudio(),
                AssetsVideo(),
                NetworkVideo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
