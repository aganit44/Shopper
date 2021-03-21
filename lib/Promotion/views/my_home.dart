import 'dart:convert';

import 'package:Shopper/Product/Product/All_product.dart';
import 'package:Shopper/Product/Product/detail_page.dart';
import 'package:Shopper/Promotion/data/data.dart';
import 'package:Shopper/Promotion/models/categorie_model.dart';
import 'package:Shopper/Promotion/models/product_model.dart';
import 'package:Shopper/Promotion/models/trending_productmodel.dart';
import 'package:Shopper/Promotion/views/banner.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatefulWidget {
  String brand;
  MyHomePage({this.brand});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  List<TrendingProductModel> trendingProducts = [];
  List<ProductModel> products = [];
  List<CategorieModel> categories = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    functionnike() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OnitsukaTiger2(brand: "nike")));
    }

    functionVans() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OnitsukaTiger2(brand: "Vans")));
    }

    functionconverse() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OnitsukaTiger2(brand: "converse")));
    }

    functionPUMA() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OnitsukaTiger2(brand: "PUMA")));
    }

    functionadidas() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OnitsukaTiger2(brand: "adidas")));
    }

    final List<Function> ontaps = [
      functionnike,
      functionVans,
      functionconverse,
      functionPUMA,
      functionadidas
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Promotion"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              BannerSlider2(),

              /// Search Bar

              SizedBox(
                height: 20,
              ),

              SizedBox(
                height: 30,
              ),

              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      "Best Selling",
                      style: TextStyle(color: Colors.black87, fontSize: 22),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text("This week")
                  ],
                ),
              ),
              Container(
                height: 240,
                padding: EdgeInsets.only(left: 22),
                child: FutureBuilder(
                  builder: (context, snapshot) {
                    if (ConnectionState.active != null && !snapshot.hasData) {
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
                    return ListView.builder(
                        itemCount: snapshot.data.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) => DetailPage(
                                        id: snapshot.data[index]["ID"]),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Container(
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
                                              snapshot.data[index]["Images"],
                                          width: 150,
                                          height: 150,
                                        ),
                                        Text("${snapshot.data[index]["Name"]}",
                                            maxLines: 2,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Row(
                                          children: <Widget>[
                                            Text(
                                                "${snapshot.data[index]["Price"]}  ฿",
                                                maxLines: 2,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                )),
                                          ],
                                        ),
                                        Row(
                                          children: <Widget>[
                                            Text("ราคาพิเศษ ",
                                                maxLines: 2,
                                                overflow: TextOverflow.fade,
                                                style: TextStyle(
                                                  color: Colors.red,
                                                )),
                                          ],
                                        ),
                                      ],
                                    )),
                              ));
                        });
                  },
                  future: getproduct(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Text(
                  "Top Product By SHOPPER",
                  style: TextStyle(color: Colors.black87, fontSize: 22),
                ),
              ),

              SizedBox(
                height: 20,
              ),

              Container(
                height: 100,
                padding: EdgeInsets.only(left: 22),
                child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            ontaps[index]();
                          },
                          child: CategorieTile(
                            categorieName: categories[index].categorieName,
                            imgAssetPath: categories[index].imgAssetPath,
                            color1: categories[index].color1,
                            color2: categories[index].color2,
                          ));
                    }),
              ),

              /// Best Selling

              SizedBox(
                height: 20,
              ),

              /// Top categorie
            ],
          ),
        ),
      ),
    );
  }
}

class CategorieTile extends StatelessWidget {
  final String categorieName;
  final String imgAssetPath;
  final String color1;
  final String color2;

  CategorieTile(
      {this.imgAssetPath, this.color2, this.color1, this.categorieName});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 65,
            width: 110,
            margin: EdgeInsets.only(right: 16),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(int.parse(color1)),
                  Color(int.parse(color2))
                ]),
                borderRadius: BorderRadius.circular(8)),
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            child: Container(
                child: Image.asset(
              imgAssetPath,
            )),
          ),
          SizedBox(
            height: 8,
          ),
          Text(categorieName),
        ],
      ),
    );
  }
}
