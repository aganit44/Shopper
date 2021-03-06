import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../Userprofile/Profile.dart';
import 'home_page.dart';
import '../Notifications/Notifications.dart';
import 'package:bottom_bar_with_sheet/bottom_bar_with_sheet.dart';

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
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: (Colors.black),
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: onTappedBar,
        items: [
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('shop'),
            icon: Icon(Icons.shopping_cart),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('Notifications'),
            icon: Icon(Icons.notifications),
          ),
          BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('profile'),
            icon: Icon(Icons.person_rounded),
          ),
        ],
      ),
    );
  }
}
