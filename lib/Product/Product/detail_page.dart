import 'package:Shopper/Product/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:localstorage/localstorage.dart';
import 'dart:convert';
import 'package:http/http.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  LocalStorage localStorage;

  @override
  void initState() {
    localStorage = LocalStorage('Product');
    super.initState();
  }

  Future<dynamic> _ProductData() async {
    String url = "http://25.46.25.35/login/Product.php";
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("OnitsukaTiger"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Icon(
            Icons.shopping_basket,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
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
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  height: 300,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      gradient: LinearGradient(
                                        colors: [
                                          Color(0xFFE0DAE2),
                                          Color(0xFF000000)
                                        ],
                                      )),
                                ),
                                Positioned(
                                  top: -30,
                                  right: -10,
                                  child: Text(
                                    'air',
                                    style: TextStyle(
                                      fontSize: 140,
                                      color: Colors.black.withOpacity(.15),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: -30,
                                  left: -10,
                                  child: Text(
                                    'spa',
                                    style: TextStyle(
                                      fontSize: 140,
                                      color: Colors.black.withOpacity(.15),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: 15,
                                  bottom: 15,
                                  child: Text(
                                    "Nike ispa air",
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.white),
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
                                            image: AssetImage(
                                                'asset/images/shoe1.png'),
                                            fit: BoxFit.contain)),
                                  ),
                                )
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
                        child: Text(
                          'Nike ispa air Max 720',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      '\$187',
                      style: TextStyle(color: Colors.blue, fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Utilising the largest innovations and NIke's spa project which touts a pholosophy of improvise, scavaga, protect and adapr Nike ISPA Air Max 720 delivers smooth cushioning. Utilising the largest innovations and NIke's spa project which touts a pholosophy of improvise, scavaga, protect and adapr Nike ISPA Air Max 720 delivers smooth cushioning. Utilising the largest innovations and NIke's spa project which touts a pholosophy of improvise, scavaga, protect and adapr Nike ISPA Air Max 720 delivers smooth cushioning",
                      style: TextStyle(color: Colors.black54, fontSize: 15),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Colors',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                              border: Border.all(color: Colors.white, width: 4),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 0.5,
                                    blurRadius: 5)
                              ]),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.blueAccent),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.orange),
                        )
                      ],
                    ),
                  )
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
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        color: Colors.grey.withOpacity(.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 10,
                          child: IconButton(
                            icon: Icon(
                              Icons.shopping_cart,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Text(
                          'Add to cart',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 70,
                    width: MediaQuery.of(context).size.width * 0.4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        gradient: LinearGradient(
                            colors: [Color(0xFF1B161D), Color(0xFF000000)])),
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
                          'Buy Now',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
