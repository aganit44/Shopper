import 'package:Shopper/Homepage/BottomNavigation.dart';
import 'package:Shopper/api/product_api.dart';
import 'package:Shopper/api/user_api.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'endDrawer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailPage extends StatefulWidget {
  int id;
  DetailPage({this.id});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  productApi api = productApi();
  userApi api1 = userApi();

  int id = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Future getproduct() async {
    try {
      var response = await http.get(
          'http://192.168.43.200:5000/product/selectproduct?ID=' +
              id.toString());

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
        title: Text("ลายละเอียดสินค้า"),
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
                                      SizedBox(
                                        width: 100,
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
                                            width: 100,
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
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            snapshot.data["Price"] + "   Coin",
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
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Container(
                                          height: 50,
                                          width: 10,
                                          child: IconButton(
                                            icon: Icon(
                                              Icons.shopping_basket,
                                              color: Colors.white,
                                            ),
                                            onPressed: () {},
                                          ),
                                        ),
                                        Text(
                                          "       Add To Cart",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                              ),
                            )
                          ],
                        ),
                        Container(
                          width: 150.0,
                          height: 70.0,

                          // ignore: deprecated_member_use
                          child: RaisedButton(
                              color: Colors.deepOrange,
                              splashColor: Colors.white,
                              onPressed: () async {
                                var res1 = await snapshot.data["Price"];
                                var price = int.parse(res1);

                                var prices = user.Coin - price;
                                var prices2 = user.Coin = prices;

                                var stork = await snapshot.data["Stock"];
                                var storks = int.parse(stork);
                                var storkss = storks - 1;

                                print(storkss);
                                if (user.Coin <= 0) {
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "ยอดเงินของคุณไม่พอ",
                                    desc: "",
                                    buttons: [
                                      DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () => Navigator.push(
                                                  context, MaterialPageRoute(
                                                      builder: (context) {
                                                return Bottomnavigations(
                                                  selectedIndex: 0,
                                                );
                                              })))
                                    ],
                                  ).show();
                                }
                                if (storks < 1) {
                                  Alert(
                                    context: context,
                                    type: AlertType.error,
                                    title: "สินค้าหมด",
                                    desc: "",
                                    buttons: [
                                      DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () => Navigator.push(
                                                  context, MaterialPageRoute(
                                                      builder: (context) {
                                                return Bottomnavigations(
                                                  selectedIndex: 0,
                                                );
                                              })))
                                    ],
                                  ).show();
                                } else {
                                  api.updatestock(storkss, id.toString());
                                  api1.coin(prices2, user.Id.toString());

                                  Alert(
                                    context: context,
                                    type: AlertType.success,
                                    title: "คุณซื้อสินค้าชิ้นนี้ไปแล้ว",
                                    desc: "",
                                    buttons: [
                                      DialogButton(
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          onPressed: () => Navigator.push(
                                                  context, MaterialPageRoute(
                                                      builder: (context) {
                                                return Bottomnavigations(
                                                  selectedIndex: 0,
                                                );
                                              })))
                                    ],
                                  ).show();
                                }
                              },
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    width: 10,
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.shopping_cart_sharp,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {},
                                    ),
                                  ),
                                  Text(
                                    "      Buy Now",
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
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
