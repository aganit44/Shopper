import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'BottomNavigation.dart';
import 'package:provider/provider.dart';

class DrawerNavition extends StatefulWidget {
  @override
  _DrawerNavitionState createState() => _DrawerNavitionState();
}

class _DrawerNavitionState extends State<DrawerNavition> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            accountName: Text("${user.Name}"),
            accountEmail: Text("${user.Email}"),
            currentAccountPicture: Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "http://25.46.25.35:5000/image?path=" + user.Image),
                  radius: 40.0,
                )),
          ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('Shop'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Bottomnavigations(selectedIndex: 0)),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notifications'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Bottomnavigations(selectedIndex: 1)),
              )
            },
          ),
          ListTile(
            leading: Icon(Icons.person_rounded),
            title: Text('Profile'),
            onTap: () => {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => Bottomnavigations(selectedIndex: 2)),
              )
            },
          ),
        ],
      ),
    );
  }
}
