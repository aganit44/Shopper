import 'dart:convert';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class Drawer2 extends StatefulWidget {
  String brand;

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer2> {
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

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 150,
            child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(SimpleLineIcons.basket),
                      Text(
                        '  Cart',
                        style: Theme.of(context).textTheme.title,
                      ),
                    ],
                  ),
                  onTap: () {},
                )),
          ),

          Flexible(
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (ConnectionState.active != null && !snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }

                if (ConnectionState.done != null && snapshot.hasError) {
                  return Center(child: Text(snapshot.error));
                }

                return ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(
                        //   MaterialPageRoute(
                        //     builder: (_) =>
                        //         DetailPage(id: snapshot.data[index]["ID"]),
                        //   ),
                        // );
                      },
                      child: Container(
                        margin:
                            EdgeInsets.only(left: 16, right: 16, bottom: 10),
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 10,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Row(
                          children: <Widget>[
                            Image.network(
                              'http://192.168.43.200:5000/product/image?path=' +
                                  snapshot.data[index]["Images"],
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    child: Text(
                                      "${snapshot.data[index]["Name"]}",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  // Text(
                                  //   "${data.brand}",
                                  //   style: TextStyle(
                                  //     color: Colors.black26,
                                  //     height: 1.5,
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: Text(
                                "\$${snapshot.data[index]["Price"]}",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      indent: 10,
                      endIndent: 10,
                    );
                  },
                );
              },
              future: getproduct(),
            ),
          ),
          // const Expanded(child: CartContent())
        ],
      ),
    );
  }
}
