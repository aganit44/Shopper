import 'package:Shopper/Homepage/BottomNavigation.dart';
import 'package:Shopper/Profile/profile_menu.dart';
import 'package:Shopper/Userprofile/top_header.dart';
import 'package:flutter/material.dart';
import '../Login/login_page.dart';
import 'editprofile.dart';

class Page1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Page1();
  }
}

class _Page1 extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          AppBar(
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
            title: Text(
              "Profile",
              style: TextStyle(
                color: Colors.black,
                decorationStyle: TextDecorationStyle.wavy,
              ),
            ),
            centerTitle: true,
          ),
          topheader(),
          ProfileMenu(
            text: "My Account",
            icon: "assets/icons/User Icon.svg",
            press: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage()),
              )
            },
          ),
          ProfileMenu(
            text: "Notifications",
            icon: "assets/icons/Bell.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "Settings",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
