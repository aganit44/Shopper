import 'package:Shopper/Homepage/BottomNavigation.dart';
import 'package:Shopper/api/product_api.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'endDrawer.dart';

class DetailPage extends StatefulWidget {
  int id;
  DetailPage({this.id});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  productApi api = productApi();
  int id = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future getproduct() async {
    try {
      var response = await http.get(
          'http://25.46.25.35:5000/product/selectproduct?ID=' + id.toString());

      return json.decode(response.body);
    } catch (error) {
      throw error;
    }
  }

  @override
  void initState() {
    id = widget.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    return Scaffold(
      endDrawer: Drawer2(iduser: user.Id),
      appBar: AppBar(
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
              return Center(child: CircularProgressIndicator());
            }

            if (ConnectionState.done != null && snapshot.hasError) {
              return Center(child: Text(snapshot.error));
            }
            child:
            return Column(
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        height: 300,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20)),
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0xFFFFFFFF),
                                                Color(0xFFFFF8F8)
                                              ],
                                            )),
                                      ),
                                      Positioned(
                                        left: 15,
                                        bottom: 15,
                                        child: Text(
                                          snapshot.data["Name"],
                                          style: TextStyle(
                                              fontSize: 30,
                                              color: Colors.black),
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
                                                    image: NetworkImage(
                                                      'http://192.168.43.200:5000/product/image?path=' +
                                                          snapshot
                                                              .data["Images"],
                                                    ),
                                                    fit: BoxFit.cover))),
                                      ),
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
                                // child: Text(
                                //   snapshot.data["information"],
                                //   style: TextStyle(fontSize: 25),
                                // ),
                                ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data["Price"] + "฿",
                            style: TextStyle(color: Colors.red, fontSize: 30),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data["information"],
                            style:
                                TextStyle(color: Colors.black54, fontSize: 15),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          // child: Text(
                          //   'Size',
                          //   style: TextStyle(fontSize: 30),
                          // ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            // ignore: deprecated_member_use
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: 150.0,
                                height: 70.0,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(1)),
                                    gradient: LinearGradient(colors: [
                                      Color(0xFFFFFFFF),
                                      Color(0xFF000000)
                                    ])),
                                // ignore: deprecated_member_use
                                child: RaisedButton(
                                  color: Colors.black,
                                  splashColor: Colors.white,
                                  onPressed: () async {
                                    var res =
                                        await api.Userproduct(user.Id, id);

                                    print(res.statusCode);

                                    if (res.statusCode == 200) {
                                      //Map<String, dynamic> data = jsonDecode(res.body);
                                      print("yes");

                                      Alert(
                                        context: context,
                                        type: AlertType.success,
                                        title: "เพิ่มสินค้าสำเร็จ",
                                        desc: "",
                                        buttons: [
                                          DialogButton(
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.pop(context))
                                        ],
                                      ).show();
                                    } else {
                                      Alert(
                                        context: context,
                                        type: AlertType.error,
                                        title: "คุณเพิ่มสินค้าชิ้นนี้ไปแล้ว",
                                        desc: "",
                                        buttons: [
                                          DialogButton(
                                              child: Text(
                                                "OK",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 20),
                                              ),
                                              onPressed: () =>
                                                  Navigator.push(context,
                                                      MaterialPageRoute(
                                                          builder: (context) {
                                                    return Bottomnavigations(
                                                      selectedIndex: 0,
                                                    );
                                                  })))
                                        ],
                                      ).show();
                                    }
                                  },
                                  child: new Text(
                                    "Add To Cart",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Container(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.4,
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
                                '   Buy Now',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
          future: getproduct(),
        ),
      ),
    );
  }
}

// body: Container(
