import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'BottomNavigation.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:animated_drawer/views/animated_drawer.dart';

class DrawerNavition extends StatefulWidget {
  @override
  _DrawerNavitionState createState() => _DrawerNavitionState();
}

class _DrawerNavitionState extends State<DrawerNavition> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    return AnimatedDrawer(
      homePageXValue: 150,
      homePageYValue: 80,
      homePageAngle: -0.2,
      homePageSpeed: 250,
      shadowXValue: 122,
      shadowYValue: 110,
      shadowAngle: -0.275,
      shadowSpeed: 550,
      openIcon: Icon(Icons.menu_open, color: Color(0xFF0E0E0F)),
      closeIcon: Icon(Icons.arrow_back_ios, color: Color(0xFF000000)),
      shadowColor: Color(0xFFF8F7FF),
      backgroundGradient: LinearGradient(
        colors: [Color(0xFFFFFFFF), Color(0xFF636262)],
      ),
      menuPageContent: Padding(
        padding: const EdgeInsets.only(top: 100.0, left: 15),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://25.46.25.35:5000/image?path=" + user.Image),
                radius: 40.0,
              ),
              Row(
                children: [
                  Text(
                    "      ${user.Name}",
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 40),
              ),
              ListTile(
                leading: Icon(Icons.shopping_cart),
                title: Text('Shop'),
                onTap: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Bottomnavigations(selectedIndex: 0)),
                  )
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications'),
                onTap: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Bottomnavigations(selectedIndex: 1)),
                  )
                },
              ),
              Padding(
                padding: EdgeInsets.only(bottom: 20),
              ),
              ListTile(
                leading: Icon(Icons.person_rounded),
                title: Text('Profile'),
                onTap: () => {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            Bottomnavigations(selectedIndex: 2)),
                  )
                },
              ),
            ],
          ),
        ),
      ),
      homePageContent: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.white,
        child: Center(child: VideoDemo()),
      ),
    );

    // child: ListView(
    //   padding: EdgeInsets.zero,
    //   children: <Widget>[

    //   ],
    // ),
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
    _controller = VideoPlayerController.network(
        "https://static.nike.com/a/videos/q_90,vc_vp9/83549ee5-9839-4ae6-9da6-a1a1865d0393/video.webm");
    //_controller = VideoPlayerController.asset("videos/sample_video.mp4");
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
