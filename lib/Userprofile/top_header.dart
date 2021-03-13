import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';

class topheader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TopHeader();
  }
}
//var user = storage.getItem('data');

class TopHeader extends State {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();

    return Container(
      decoration: BoxDecoration(),
      height: MediaQuery.of(context).size.height * 0.25,
      child: Stack(
        children: <Widget>[
          Row(),
          Align(
            alignment: Alignment(0, -0.5),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 50.0,
                    backgroundImage: NetworkImage(
                        "http://192.168.43.200:5000/image?path=" + user.Image),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    '${user.Name}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4.0),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
