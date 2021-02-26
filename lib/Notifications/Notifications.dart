import 'package:flutter/material.dart';
import 'package:hello/Profile/profile_menu2.dart';

class Notifications extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('การแจ้งเตือน'),
        actions: [
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 5),
          ProfileMenu(
            text: "โปรโมชั่น",
            icon: "assets/icons/Shop Icon.svg",
            press: () => {},
          ),
          ProfileMenu(
            text: "กิจกรรม",
            icon: "assets/icons/Gift Icon.svg",
            press: () {},
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
            height: 600,
            decoration: BoxDecoration(
              color: Colors.grey[200],
            ),
            child: Center(child: Text("", style: TextStyle(fontSize: 20))),
          )
        ],
      ),
    );
  }
}
