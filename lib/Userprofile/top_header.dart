import 'package:Shopper/api/user_api.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:provider/provider.dart';

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
    String url = "http://192.168.43.200/images/Profile.json";
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
          // image: DecorationImage(
          //   image: NetworkImage('http://192.168.43.200/images/01.jpg'),
          //   fit: BoxFit.cover,
          // ),
          ),
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

                  FutureBuilder(
                    future: _ProductData(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        localStorage.setItem('Productlist', snapshot.data);
                        var data2 = localStorage.getItem('Productlist');
                        return Text(
                          '${user.Name}',
                          style: TextStyle(
                            color: Colors.black,
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
