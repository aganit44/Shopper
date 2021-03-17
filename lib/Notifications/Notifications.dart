import 'package:Shopper/Homepage/BottomNavigation.dart';
import 'package:Shopper/ProfileMenu/profile_menu.dart';
import 'package:Shopper/Userprofile/top_header.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Notifications extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Bottomnavigations(
                        selectedIndex: 0,
                      )),
            );
          },
        ),
        title: Text("Notifications"),
        centerTitle: true,
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            SizedBox(height: 5),
            ProfileMenu(
              text: "โปรโมชั่น",
              icon: "assets/icons/Shop Icon.svg",
              press: () => {},
            ),
            ProfileMenu(
              text: "รายการอัปเดตจากShopper",
              icon: "assets/icons/Mail.svg",
              press: () {},
            ),
            ProfileMenu(
              text: "อัพเดตคำสั่งซื้อ",
              icon: "assets/icons/Parcel.svg",
              press: () {},
            ),
            SizedBox(height: 5),
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[10],
              ),
              child: (VideoDemo()),
            )
          ],
        ),
      ),
    );
  }
}

class VideoDemo extends StatefulWidget {
  VideoDemo() : super();

  final String title = "Video Demo";

  @override
  VideoDemoState createState() => VideoDemoState();
}

class VideoDemoState extends State<VideoDemo> {
  //
  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // _controller = VideoPlayerController.network(
    // "https://static.nike.com/a/videos/q_90,vc_vp9/voqnamnyjdpncnyhdtej/video.webm");
    _controller = VideoPlayerController.asset("assets/videos/Nike_1080p.mp4");
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    _controller.setVolume(1.0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          setState(() {
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              _controller.play();
            }
          });
        },
        child:
            Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
      ),
    );
  }
}
