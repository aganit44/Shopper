import 'dart:convert';

import 'package:Shopper/Product/Product/Addproduct.dart';
import 'package:Shopper/Product/Product/Editproduct.dart';
import 'package:Shopper/api/product_api.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:provider/provider.dart';

import 'package:http/http.dart' as http;
import 'package:rflutter_alert/rflutter_alert.dart';

import 'detail_page.dart';
import 'endDrawer.dart';

class OnitsukaTiger2 extends StatefulWidget {
  String brand;
  OnitsukaTiger2({this.brand});

  @override
  _OnitsukaTiger2State createState() => _OnitsukaTiger2State();
}

class _OnitsukaTiger2State extends State<OnitsukaTiger2> {
  productApi api = productApi();

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

  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    return Scaffold(
        endDrawer: Drawer2(iduser: user.Id),
        appBar: AppBar(
          title: Text(brand),
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
                        padding:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 5),
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
                                      const EdgeInsets.symmetric(horizontal: 0),
                                  child: Visibility(
                                    visible: user.Admin < 1 ? false : true,
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.close_rounded,
                                        ),
                                        iconSize: 30,
                                        color: Colors.red,
                                        onPressed: () async {
                                          Alert(
                                              context: context,
                                              type: AlertType.error,
                                              title:
                                                  "ต้องการลบสินค้าไช่หรือไม่",
                                              desc: "",
                                              buttons: [
                                                DialogButton(
                                                    child: Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                    onPressed: () async {
                                                      setState(() {});
                                                      var res = await api
                                                          .deleteproductAdmin(
                                                              snapshot.data[
                                                                  index]["ID"]);
                                                      print(res);
                                                      if (snapshot.data[index]
                                                              ["ID"] !=
                                                          null) {}
                                                      Navigator.pop(context,
                                                          setState(() {}));
                                                    })
                                              ]).show();
                                        }),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    user.Admin < 1
                                        ? Icon(
                                            Icons.monetization_on,
                                            color: Colors.yellowAccent,
                                          )
                                        : IconButton(
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
                                                        Editproduct(
                                                          index: index,
                                                          data: snapshot.data,
                                                        )),
                                              ),
                                            },
                                          ),
                                    Text("${snapshot.data[index]["Price"]}  ฿",
                                        maxLines: 2,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        )),
                                  ],
                                ),
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
        floatingActionButton: floatingActionButton2(user: user));
  }
}

class floatingActionButton2 extends StatelessWidget {
  const floatingActionButton2({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: user.Admin < 1 ? false : true,
      child: SpeedDial(
        marginEnd: 18,
        marginBottom: 20,
        icon: Icons.add,
        activeIcon: Icons.remove,
        buttonSize: 56.0,
        visible: true,
        closeManually: false,
        renderOverlay: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        onOpen: () => print('OPENING DIAL'),
        onClose: () => print('DIAL CLOSED'),
        tooltip: 'Speed Dial',
        heroTag: 'speed-dial-hero-tag',
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 8.0,
        shape: CircleBorder(),
        children: [
          SpeedDialChild(
            child: Icon(Icons.add_business_rounded),
            backgroundColor: Colors.white,
            label: 'Addproduct',
            labelStyle: TextStyle(fontSize: 18.0),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addproduct()),
              ),
            },
          ),
        ],
      ),
    );
  }
}


