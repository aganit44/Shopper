import 'dart:convert';
import 'package:Shopper/Product/Product/All_product.dart';
import 'package:http/http.dart' as http;

import 'package:Shopper/Product/Product/detail_page.dart';
import 'package:flutter/material.dart';

class Promotion extends StatefulWidget {
  String brand;
  Promotion({this.brand});
  @override
  _PromotionState createState() => _PromotionState();
}

class _PromotionState extends State<Promotion> {
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

  List<String> url = [
    'https://www.promotiontoyou.com/wp-content/uploads/2020/03/Promotion-Nike-by-Supersport-1.jpg',
    'https://www.promotiontoyou.com/wp-content/uploads/2020/03/NIKE-Zoom-Rize.jpg',
    'https://www.promotiontoyou.com/wp-content/uploads/2020/03/Nike-Air-Max.jpg',
    'https://www.promotiontoyou.com/wp-content/uploads/2020/03/NIKE-Air-Zoom-Terra-Kiger-5.jpg'
  ];
  List menu = [
    {
      'name': 'Nike ',
      "image": "assets/images/banner_1.jpg",
      "Description": 'โปรโมชั่น ลด 20%',
      'icon': ""
    },
    {
      'name': 'converse',
      "image": "assets/logo/converse.jpg",
      "Description": 'โปรโมชั่น ลด 50%',
      'icon': ""
    },
    {
      'name': 'PUMA',
      "image": "assets/logo/Puma.png",
      "Description": 'โปรโมชั่น ลด 70%',
      "icon": ''
    },
    {
      'name': 'Vans',
      "image": "assets/logo/Vans.png",
      "Description": 'โปรโมชั่น ลด 20%',
      'icon': ""
    },
    {
      'name': 'Newbalance',
      "image": "assets/logo/Newbalance.png",
      "Description": 'โปรโมชั่น ลด 30%',
      'icon': ""
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "Promotion",
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.monetization_on,
                        color: Colors.yellow[800],
                      ),
                      Text(
                        "โปรโมชั่น",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  )),
              Container(
                //margin: EdgeInsets.only(top: 40,),
                height: 200,
                alignment: Alignment.topLeft,
                padding: EdgeInsets.all(6),
                // color: Colors.black38,
                child: ListView(
                  //padding: EdgeInsets.all(6),
                  scrollDirection: Axis.horizontal,
                  children: [
                    Row(
                        children: url
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.only(left: 10, right: 10),
                                width: 150,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black12.withOpacity(0.3),
                                      spreadRadius: 0.5,
                                      blurRadius: 4,
                                      offset: Offset(
                                          0, 2), // changes position of shadow
                                    ),
                                  ],
                                  image: DecorationImage(
                                    fit: BoxFit.fitHeight,
                                    image: NetworkImage(e),
                                  ),
                                ),
                              ),
                            )
                            .toList())
                  ],
                ),
              ),
              Container(
                child: Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                    ),
                    FutureBuilder(
                      builder: (context, snapshot) {
                        if (ConnectionState.active != null &&
                            !snapshot.hasData) {
                          return Center(
                              child: CircularProgressIndicator(
                            semanticsLabel: 'Linear progress indicator',
                            backgroundColor: Colors.white,
                            valueColor:
                                new AlwaysStoppedAnimation<Color>(Colors.black),
                          ));
                        }

                        if (ConnectionState.done != null && snapshot.hasError) {
                          return Center(child: Text(snapshot.error));
                        }
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    OnitsukaTiger2(brand: "converse"),
                              ),
                            );
                          },
                          child: Container(
                            height: 300,
                            child: ListView(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Icon(
                                      Icons.monetization_on,
                                      color: Colors.yellow[800],
                                    ),
                                    Text(
                                      "รายการรองเท้า",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                  itemCount: 1,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (_) => DetailPage(
                                                id: snapshot.data[index]["ID"]),
                                          ),
                                        );
                                      },
                                      child: Container(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 1, horizontal: 5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(10),
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black12,
                                                spreadRadius: 5,
                                                blurRadius: 15,
                                              ),
                                            ],
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              Image.network(
                                                'http://192.168.43.200:5000/product/image?path=' +
                                                    snapshot.data[index]
                                                        ["Images"],
                                                width: 150,
                                                height: 100,
                                              ),
                                              Text(
                                                  "${snapshot.data[index]["Name"]}",
                                                  maxLines: 2,
                                                  overflow: TextOverflow.fade,
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                  )),
                                              Row(
                                                children: <Widget>[
                                                  Padding(
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 0),
                                                  ),
                                                  Row(
                                                    children: <Widget>[
                                                      Text(
                                                          "${snapshot.data[index]["Price"]}  ฿",
                                                          maxLines: 2,
                                                          overflow:
                                                              TextOverflow.fade,
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          )),
                                                    ],
                                                  ),
                                                ],
                                              )
                                            ],
                                          )),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      future: getproduct(),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
