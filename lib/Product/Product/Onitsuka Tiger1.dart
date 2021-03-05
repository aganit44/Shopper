import 'dart:convert';

import 'package:Shopper/Product/Product/banner3.dart';
import 'package:flutter/material.dart';

import '../../Addproduct.dart';

import 'package:http/http.dart' as http;

import 'detail_page.dart';
import 'detail_page2.dart';

class OnitsukaTiger1 extends StatefulWidget {
  String brand;
  OnitsukaTiger1({this.brand});

  @override
  _OnitsukaTiger2State createState() => _OnitsukaTiger2State();
}

class _OnitsukaTiger2State extends State<OnitsukaTiger1> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(brand),
          backgroundColor: Colors.black,
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

              return ListView.separated(
                padding: EdgeInsets.all(10),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
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
                      margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
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
                                  width: MediaQuery.of(context).size.width * .4,
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
                            padding: const EdgeInsets.symmetric(horizontal: 12),
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Addproduct()),
            );
          },
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          mini: true,
          child: Icon(Icons.add),
        ));
  }
}
