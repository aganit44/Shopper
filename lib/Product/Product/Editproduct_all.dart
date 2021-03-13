import 'dart:convert';

import 'package:Shopper/api/product_api.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;

import 'Editproduct.dart';
import 'detail_page.dart';

class Editproduct_all extends StatefulWidget {
  @override
  _Editproduct_allState createState() => _Editproduct_allState();
}

class _Editproduct_allState extends State<Editproduct_all> {
  productApi api = productApi();

  Future getproduct() async {
    try {
      var response =
          await http.get('http://192.168.43.200:5000/product/select?brand=');

      return json.decode(response.body);
    } catch (error) {
      throw error;
    }
  }

  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    return Scaffold(
      appBar: AppBar(
        title: Text("Editproduct_all"),
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
            );
          },
        ),
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
                      child: Column(
                        children: <Widget>[
                          Image.network(
                            'http://192.168.43.200:5000/product/image?path=' +
                                snapshot.data[index]["Images"],
                            width: 150,
                            height: 100,
                          ),
                          Text("${snapshot.data[index]["Name"]}",
                              maxLines: 2,
                              overflow: TextOverflow.fade,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              )),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 1),
                                child: Visibility(
                                  visible: user.Admin < 1 ? false : true,
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                    ),
                                    iconSize: 30,
                                    color: Colors.red,
                                    splashColor: Colors.purple,
                                    onPressed: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Editproduct()),
                                      ),
                                    },
                                  ),
                                ),
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
    );
  }
}
