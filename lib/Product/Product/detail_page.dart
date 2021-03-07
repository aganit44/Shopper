import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'endDrawer.dart';

class DetailPage extends StatefulWidget {
  int id;
  DetailPage({this.id});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int id = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future getproduct() async {
    try {
      var response = await http.get(
          'http://25.46.25.35:5000/product/selectproduct?ID=' + id.toString());

      return json.decode(response.body);
    } catch (error) {
      throw error;
    }
  }

  @override
  void initState() {
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer2(),
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: [
          Builder(
            builder: (context) => IconButton(
              icon: Icon(SimpleLineIcons.basket),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            ),
          ),
        ],
      ),
      body: Container(
        child: FutureBuilder(
          builder: (context, snapshot) {
            if (ConnectionState.active != null && !snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            if (ConnectionState.done != null && snapshot.hasError) {
              return Center(child: Text(snapshot.error));
            }
            child:
            return Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 300,
                          width: MediaQuery.of(context).size.width,
                          child: Stack(
                            children: <Widget>[
                              Container(
                                height: 300,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 20),
                                child: ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 300,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFFFFFF),
                                                Color(0xFFFFF8F8)
                                              ],
                                            )),
                                      ),
                                      Positioned(
                                        left: 15,
                                        bottom: 15,
                                        child: Text(
                                          snapshot.data["Name"],
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.black),
                                        ),
                                      ),
                                      Positioned(
                                        top: 0,
                                        left: 0,
                                        right: 0,
                                        child: Container(
                                            height: 230,
                                            width: 230,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                      'http://192.168.43.200:5000/product/image?path=' +
                                                          snapshot
                                                              .data["Images"],
                                                    ),
                                                    fit: BoxFit.cover))),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Container(
                                // child: Text(
                                //   snapshot.data["information"],
                                //   style: TextStyle(fontSize: 25),
                                // ),
                                ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data["Price"] + "฿",
                            style: TextStyle(color: Colors.red, fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data["information"],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          // child: Text(
                          //   'Size',
                          //   style: TextStyle(fontSize: 30),
                          // ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              color: Colors.grey.withOpacity(.5)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 10,
                                child: IconButton(
                                  icon: Icon(SimpleLineIcons.basket),
                                  color: Colors.black,
                                ),
                              ),
                              Text(
                                '    Add to cart',
                                style: TextStyle(fontSize: 20),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(7)),
                              gradient: LinearGradient(colors: [
                                Color(0xFF1B161D),
                                Color(0xFF000000)
                              ])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 10,
                                child: IconButton(
                                  icon: Icon(
                                    Icons.shopping_basket,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Text(
                                '   Buy Now',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          future: getproduct(),
        ),
      ),
    );
  }
}

// body: Container(
