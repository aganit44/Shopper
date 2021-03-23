import 'package:Shopper/Homepage/BottomNavigation.dart';
import 'package:Shopper/Notifications/banner3.dart';
import 'package:Shopper/Notifications/detail_user.dart';
import 'package:Shopper/Notifications/profile_menu.dart';
import 'package:Shopper/Product_update/screens/product/products_screen.dart';
import 'package:Shopper/Promotion/views/my_home.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';

import 'detail_order.dart';

class Notifications extends StatefulWidget {
  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
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
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                )
              },
            ),
            ProfileMenu(
              text: "รายการอัปเดตจากShopper",
              icon: "assets/icons/Mail.svg",
              press: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProductsScreen()),
                )
              },
            ),
            Visibility(
              visible: user.Admin < 1 ? false : true,
              child: ProfileMenu(
                text: "รายการสั่งซื้อ",
                icon: "assets/icons/Call.svg",
                press: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detaill(iduser2: user.Id)),
                  )
                },
              ),
            ),
            Visibility(
              visible: user.Admin < 1 ? true : false,
              child: ProfileMenu(
                text: "อัพเดตคำสั่งซื้อ",
                icon: "assets/icons/Parcel.svg",
                press: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detailluser(iduser2: user.Id)),
                  )
                },
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Colors.grey[10],
              ),
              child: (BannerSlider5()),
            )
          ],
        ),
      ),
    );
  }
}
