import 'package:flutter/material.dart';
import 'file:///C:/Program%20Files/shopper/lib/Homepage/banner2.dart';
import 'file:///C:/Program%20Files/shopper/lib/Homepage/banner.dart';
import 'main_manu.dart';


class HomePage extends StatefulWidget {
  final String name;

  const HomePage({Key key, this.name}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _scrollController = TrackingScrollController();

  @override
  Widget build(BuildContext context) {




    return Scaffold(


      backgroundColor: Colors.white,


      body: ListView(
          children: [
            BannerSlider(),
            MainMenu(),
            BannerSlider2(),
            Container(height: 0),
              //2 - NavigationBarWidget

            ]),
       );

  }
}
