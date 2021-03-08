import 'package:flutter/material.dart';
import 'DrawerNavigation.dart';
import 'banner.dart';
import 'banner2.dart';
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.white),
        // ),
        title: Text(
          "Shopper",
          style: TextStyle(
            color: Colors.black,
            decorationStyle: TextDecorationStyle.wavy,
          ),
        ),
        centerTitle: true,
      ),
      drawer: DrawerNavition(),
      backgroundColor: Colors.white70,
      body: ListView(children: [
        BannerSlider(),
        MainMenu(),
        BannerWidgetArea(),
        Container(height: 0),
        //2 - NavigationBarWidget
      ]),
    );
  }
}
