import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:hello/Product/NewProduct/Nike/detail_page.dart';
import 'banner5.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:hello/Product/models/shoe_model.dart';
import 'package:hello/Product/NewProduct/Nike/detail_page.dart';
import 'package:hello/Product/NewProduct/Nike/detail_page2.dart';
import 'package:hello/Product/NewProduct/Nike/detail_page3.dart';

class Nike extends StatefulWidget {
  @override
  _NikeState createState() => _NikeState();
}

class _NikeState extends State<Nike> {
  List<ShoeModel> shoeList = ShoeModel.list;
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
        title: FutureBuilder(
          future: _ProductData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              localStorage.setItem('Productlist', snapshot.data);
              var data = localStorage.getItem('Productlist');
              CircularProgressIndicator();
              return Text('Nike');
            } else if (snapshot.hasError) {
              return CircularProgressIndicator();
            } else {
              return CircularProgressIndicator();
            }
          },
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
      body: ListView(
        children: <Widget>[
          BannerSlider5(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[],
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "JUST FOR YOU",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "VIEW ALL",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 24),
          Container(
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
                FutureBuilder(
                  future: _ProductData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      localStorage.setItem('Productlist', snapshot.data);
                      var data = localStorage.getItem('Productlist');
                      return Image.network(
                        '${data[0]['Images']}',
                        width: 100,
                        height: 100,
                      );
                    } else if (snapshot.hasError) {
                      return CircularProgressIndicator();
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: FutureBuilder(
                          future: _ProductData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              localStorage.setItem(
                                  'Productlist', snapshot.data);
                              var data = localStorage.getItem('Productlist');
                              CircularProgressIndicator();
                              return Text('${data[0]['Name']}');
                            } else if (snapshot.hasError) {
                              return CircularProgressIndicator();
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                      FutureBuilder(
                        future: _ProductData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            localStorage.setItem('Productlist', snapshot.data);
                            var data = localStorage.getItem('Productlist');
                            CircularProgressIndicator();
                            return Text('OnitsukaTiger');
                          } else if (snapshot.hasError) {
                            return CircularProgressIndicator();
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                IconButton(
                  icon: Image.network(
                      "https://cdn0.iconfinder.com/data/icons/simpline-mix/64/simpline_41-512.png"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Nike1()),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
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
                FutureBuilder(
                  future: _ProductData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      localStorage.setItem('Productlist', snapshot.data);
                      var data = localStorage.getItem('Productlist');
                      CircularProgressIndicator();
                      return Image.network(
                        '${data[1]['Images']}',
                        width: 100,
                        height: 100,
                      );
                    } else if (snapshot.hasError) {
                      return CircularProgressIndicator();
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: FutureBuilder(
                          future: _ProductData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              localStorage.setItem(
                                  'Productlist', snapshot.data);
                              var data = localStorage.getItem('Productlist');
                              CircularProgressIndicator();
                              return Text('${data[1]['Name']}');
                            } else if (snapshot.hasError) {
                              return CircularProgressIndicator();
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                      FutureBuilder(
                        future: _ProductData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            localStorage.setItem('Productlist', snapshot.data);
                            var data = localStorage.getItem('Productlist');
                            CircularProgressIndicator();
                            return Text('OnitsukaTiger');
                          } else if (snapshot.hasError) {
                            return CircularProgressIndicator();
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                IconButton(
                  icon: Image.network(
                      "https://cdn0.iconfinder.com/data/icons/simpline-mix/64/simpline_41-512.png"),
                  color: Colors.indigo,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Nike2()),
                    );
                  },
                ),
              ],
            ),
          ),
          Container(
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
                FutureBuilder(
                  future: _ProductData(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      localStorage.setItem('Productlist', snapshot.data);
                      var data = localStorage.getItem('Productlist');
                      CircularProgressIndicator();
                      return Image.network(
                        '${data[2]['Images']}',
                        width: 100,
                        height: 100,
                      );
                    } else if (snapshot.hasError) {
                      return CircularProgressIndicator();
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        child: FutureBuilder(
                          future: _ProductData(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              localStorage.setItem(
                                  'Productlist', snapshot.data);
                              var data = localStorage.getItem('Productlist');
                              CircularProgressIndicator();
                              return Text('${data[2]['Name']}');
                            } else if (snapshot.hasError) {
                              return CircularProgressIndicator();
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                      ),
                      FutureBuilder(
                        future: _ProductData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.hasData) {
                            localStorage.setItem('Productlist', snapshot.data);
                            var data = localStorage.getItem('Productlist');
                            CircularProgressIndicator();
                            return Text('OnitsukaTiger');
                          } else if (snapshot.hasError) {
                            return CircularProgressIndicator();
                          } else {
                            return CircularProgressIndicator();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                ),
                IconButton(
                  icon: Image.network(
                      "https://cdn0.iconfinder.com/data/icons/simpline-mix/64/simpline_41-512.png"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Nike3()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
