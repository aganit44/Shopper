import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../Userprofile/Profile.dart';
import 'home_page.dart';
import '../Notifications/Notifications.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// ignore: must_be_immutable
class Bottomnavigations extends StatefulWidget {
  int selectedIndex = 0;
  Bottomnavigations({this.selectedIndex});

  @override
  _BottomnavigationsState createState() => _BottomnavigationsState();
}

class _BottomnavigationsState extends State<Bottomnavigations> {
  LocalStorage storage = LocalStorage('user');
  List<dynamic> user;

  _BottomnavigationsState();

  int _currentIndex = 0;

  void onTappedBar(int index) {
    setState(() {
      widget.selectedIndex = index;
      _currentIndex = widget.selectedIndex;
    });
  }

  void initState() {
    user = storage.getItem('data');

    onTappedBar(widget.selectedIndex);
    super.initState();
  }

  final List<Widget> _childern = [
    HomePage(),
    Notifications(),
    Page1(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: _childern[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.black,
          items: <Widget>[
            Icon(Icons.shopping_cart_sharp, size: 25),
            Icon(Icons.notification_important_sharp, size: 25),
            Icon(Icons.accessibility_rounded, size: 25),
          ],
          onTap: onTappedBar),
    );
  }
}
