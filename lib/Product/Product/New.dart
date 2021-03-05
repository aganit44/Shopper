import 'dart:convert';

import 'package:Shopper/Product/Product/banner3.dart';
import 'package:flutter/material.dart';

import '../../Addproduct.dart';

import 'package:http/http.dart' as http;

import 'detail_page.dart';
import 'detail_page2.dart';

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
          .get('http://25.46.25.35:5000/product/select?brand=' + brand);

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
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 5),
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
                      child: Image.network(
                        'http://25.46.25.35:5000/product/image?path=' +
                            snapshot.data[index]["Images"],
                        width: 160,
                        height: 150,
                      ),
                    ),
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
