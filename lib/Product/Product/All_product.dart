import 'dart:convert';

import 'package:Shopper/Product/Product/Addproduct.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

import 'detail_page.dart';
import 'endDrawer.dart';

class OnitsukaTiger2 extends StatefulWidget {
  String brand;
  OnitsukaTiger2({this.brand});

  @override
  _OnitsukaTiger2State createState() => _OnitsukaTiger2State();
}

class _OnitsukaTiger2State extends State<OnitsukaTiger2> {
  String brand = "";
  Future getproduct() async {
    try {
      var response = await http
          .get('http://192.168.43.200:5000/product/select?brand=' + brand);

      return json.decode(response.body);
    } catch (error) {
      throw error;
    }
  }

  void initState() {
    brand = widget.brand;
    super.initState();
  }

  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    return Scaffold(
        endDrawer: Drawer2(iduser: user.Id),
        appBar: AppBar(
          title: Text(brand),
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
                return Center(
                    child: CircularProgressIndicator(
                  semanticsLabel: 'Linear progress indicator',
                  backgroundColor: Colors.white,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.black),
                ));
              }

              if (ConnectionState.done != null && snapshot.hasError) {
                return Center(child: Text(snapshot.error));
              }

              return GridView.builder(
                primary: false,
                padding: const EdgeInsets.all(15),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 1, mainAxisSpacing: 1, crossAxisCount: 2),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) =>
                              DetailPage(id: snapshot.data[index]["ID"]),
                        ),
                      );
                    },
                    child: Container(
                        margin: EdgeInsets.only(left: 1, right: 8, bottom: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 10,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Image.network(
                              'http://192.168.43.200:5000/product/image?path=' +
                                  snapshot.data[index]["Images"],
                              width: 160,
                              height: 110,
                            ),
                            Text("${snapshot.data[index]["Name"]}",
                                maxLines: 2,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.monetization_on,
                                  color: Colors.yellow,
                                  size: 25.0,
                                ),
                                Text(
                                    "        ${snapshot.data[index]["Price"]}  ฿",
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            )
                          ],
                        )),
                  );
                },
              );
            },
            future: getproduct(),
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addproduct()),
            );
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          label: Text('Addprodurt'),
          icon: Icon(Icons.add),
        ));
  }
}
