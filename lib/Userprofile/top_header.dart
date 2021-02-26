import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import '../Homepage/BottomNavigation.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:hello/providers/user_provider.dart';
import 'package:hello/model/User.dart';

class topheader extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TopHeader();
  }
}
//var user = storage.getItem('data');

class TopHeader extends State {
  LocalStorage localStorage;

  @override
  void initState() {
    localStorage = LocalStorage('Product');
    super.initState();
  }

  Future<dynamic> _ProductData() async {
    String url = "http://25.46.25.35/images/Profile.json";
    var response = await get(url);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var data = jsonDecode(response.body);

        return data;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('http://25.46.25.35/images/01.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Stack(
        children: <Widget>[
          Row(),
          SafeArea(
            child: IconButton(
              icon: Icon(
                Icons.keyboard_arrow_left,
                color: Colors.deepOrange,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Bottomnavigations()),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment(0, -0.5),
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(
                    maxRadius: 50.0,
                    backgroundImage:
                        NetworkImage('http://25.46.25.35/images/3.jfif'),
                  ),
                  SizedBox(height: 5.0),

                  FutureBuilder(
                    future: _ProductData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        localStorage.setItem('Productlist', snapshot.data);
                        var data2 = localStorage.getItem('Productlist');
                        return Text(
                          '${user.Name}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21.0,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return CircularProgressIndicator();
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  // Text('Admin',
                  //   style: TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 21.0,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ),
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
