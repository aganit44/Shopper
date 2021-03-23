import 'dart:convert';
import 'package:Shopper/Homepage/BottomNavigation.dart';
import 'package:Shopper/Product/Product/Editproduct.dart';
import 'package:Shopper/Product/Product/endDrawer.dart';
import 'package:Shopper/api/product_api.dart';
import 'package:Shopper/api/user_api.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class detaill extends StatefulWidget {
  String address;
  int iduser2;

  detaill({this.address, this.iduser2});
  @override
  _detaillState createState() => _detaillState();
}

class _detaillState extends State<detaill> {
  int iduser2 = 0;

  productApi api = productApi();
  userApi api1 = userApi();

  String address = "";

  Future getproduct() async {
    try {
      var response = await http
          .get('http://192.168.43.200:5000/product/selectaddressuser');

      return json.decode(response.body);
    } catch (error) {
      throw error;
    }
  }

  void initState() {
    iduser2 = widget.iduser2;
    super.initState();
  }

  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    return Scaffold(
      appBar: AppBar(
        title: Text("ลายละเอียดคำสั่งซื้อลูกค้า"),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Bottomnavigations(
                            selectedIndex: 0,
                          )),
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
              return Center(child: Text("ไม่มีคำสั่งซื้อ"));
            }

            if (ConnectionState.done != null && snapshot.hasError) {
              return Center(child: Text(snapshot.error));
            }

            return ListView.separated(
              padding: EdgeInsets.all(10),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (_) =>
                    //         DetailPage(id: snapshot.data[index]["ID"]),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 1, right: 1, bottom: 10),
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 25),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(children: <Widget>[
                            Expanded(
                              child: Column(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                .4,
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Text(
                                          'ID ลูกค้า = ${snapshot.data[index]["UsersID"]}',
                                          style: TextStyle(
                                            color: Colors.blueAccent[700],
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Text(
                                          'ลูกค้าสั่งสินค้าที่ =${snapshot.data[index]["ProsID"]}',
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Row(children: [
                                          Text(
                                            'สถานะ : ',
                                            style: TextStyle(
                                              color: Colors.blue[900],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                          Text(
                                            '${snapshot.data[index]["StaTus"]}',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Text(
                                          'รหัสไปรษณีย์ ${snapshot.data[index]["Address"]}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 1),
                                        child: Text(
                                          'ที่อยู่การจัดส่ง ${snapshot.data[index]["PinCode"]}',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 1),
                                    ),
                                  ]),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 1),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                          Center(
                            child: Row(
                              children: <Widget>[
                                IconButton(
                                  icon: Icon(
                                    Icons.done,
                                  ),
                                  iconSize: 30,
                                  color: Colors.green[700],
                                  splashColor: Colors.purple,
                                  onPressed: () => {
                                    api.updateconfirm(
                                        "อนุมัติคำสั่งซื้อลอการจัดส่ง",
                                        snapshot.data[index]["ID"].toString()),
                                    setState(() {}),
                                  },
                                ),
                                Text("อนุมัติคำสั่งซื้อ",
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                                Center(
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.cancel,
                                    ),
                                    iconSize: 30,
                                    color: Colors.red[700],
                                    splashColor: Colors.purple,
                                    onPressed: () async {
                                      api.updateconfirm(
                                          "ไม่อนุมัติ",
                                          snapshot.data[index]["ID"]
                                              .toString());

                                      //Map<String, dynamic> data = jsonDecode(res.body);
                                      setState(() {});
                                    },
                                  ),
                                ),
                                Text("ไม่อนุมัติคำสั่งซื้อ",
                                    maxLines: 2,
                                    overflow: TextOverflow.fade,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    )),
                              ],
                            ),
                          ),
                          Row(
                            children: <Widget>[],
                          ),
                        ],
                      ),
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
      ),
    );
  }
}

// ignore: camel_case_types
