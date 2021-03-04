import 'dart:convert';

import 'package:Shopper/Product/Product/banner3.dart';
import 'package:flutter/material.dart';

import '../../Addproduct.dart';

import 'package:http/http.dart' as http;

import 'detail_page2.dart';

class OnitsukaTiger2 extends StatefulWidget {
  OnitsukaTiger2({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _OnitsukaTiger2State createState() => _OnitsukaTiger2State();
}

class _OnitsukaTiger2State extends State<OnitsukaTiger2> {
  Future getproduct() async {
    try {
      var response = await http.get('http://25.46.25.35:5000/product/select');

      return json.decode(response.body);
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OnitsukaTiger"),
          backgroundColor: Colors.black,
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (ConnectionState.active != null && !snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            if (ConnectionState.done != null && snapshot.hasError) {
              return Center(child: Text(snapshot.error));
            }

            return ListView.separated(
              padding: EdgeInsets.all(0),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
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
                          'http://25.46.25.35:5000/product/image?path=' +
                              snapshot.data[index]["Images"],
                          width: 90,
                          height: 60,
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
