import 'dart:convert';
import 'package:Shopper/Homepage/BottomNavigation.dart';

import 'package:Shopper/api/product_api.dart';
import 'package:Shopper/api/user_api.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:condition/condition.dart';

class detailluser extends StatefulWidget {
  String address;
  int iduser2;

  detailluser({this.address, this.iduser2});
  @override
  _detaillState createState() => _detaillState();
}

class _detaillState extends State<detailluser> {
  int iduser2 = 0;

  productApi api = productApi();
  userApi api1 = userApi();

  String address = "";

  Future getproduct() async {
    try {
      var response = await http.get(
          'http://192.168.43.200:5000/product/selectaddressuser2?UsersID=' +
              widget.iduser2.toString());

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
        title: Text("ลายละเอียดคำสั่งซื้อ"),
        centerTitle: true,
        backgroundColor: Colors.black,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Bottomnavigations(
                            selectedIndex: 0,
                          )),
                ),
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
                    padding: EdgeInsets.symmetric(vertical: 1, horizontal: 10),
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
                          Row(
                            children: <Widget>[
                              Image.network(
                                'http://192.168.43.200:5000/product/image?path=' +
                                    snapshot.data[index]["Images"],
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 35,
                                    ),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                        ),
                                        Row(children: [
                                          Text(
                                            'สถานะ : ',
                                            style: TextStyle(
                                              color: Colors.amber[600],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ),
                                          ),
                                          Container(
                                              child: Conditioned(
                                                  cases: [
                                                Case(
                                                    snapshot.data[index]
                                                            ["StaTus"] ==
                                                        'รออนุมัติ',
                                                    builder: () => Text(
                                                          '${snapshot.data[index]["StaTus"]}',
                                                          style: TextStyle(
                                                            color: Colors
                                                                .blue[900],
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                          ),
                                                        )),
                                                Case(
                                                    snapshot.data[index]
                                                            ["StaTus"] ==
                                                        'ไม่อนุมัติ',
                                                    builder: () => Text(
                                                          '${snapshot.data[index]["StaTus"]}',
                                                          style: TextStyle(
                                                            color:
                                                                Colors.red[900],
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                          ),
                                                        )),
                                                Case(
                                                    snapshot.data[index]
                                                            ["StaTus"] ==
                                                        'อนุมัติลอการจัดส่ง',
                                                    builder: () => Text(
                                                          '${snapshot.data[index]["StaTus"]}',
                                                          style: TextStyle(
                                                            color: Colors.green,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 13,
                                                          ),
                                                        )),
                                              ],
                                                  defaultBuilder: () => Text(
                                                        '${snapshot.data[index]["StaTus"]}',
                                                        style: TextStyle(
                                                          color:
                                                              Colors.blue[900],
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 13,
                                                        ),
                                                      )))
                                        ]

                                            //     : Text(
                                            //         '${snapshot.data[index]["StaTus"]}',
                                            //         style: TextStyle(
                                            //           color:
                                            //               Colors.green[900],
                                            //           fontWeight:
                                            //               FontWeight.bold,
                                            //           fontSize: 13,
                                            //         ),
                                            //       )),
                                            )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            Icons.delete_forever_outlined,
                                          ),
                                          iconSize: 30,
                                          color: Colors.red,
                                          splashColor: Colors.purple,
                                          onPressed: () async {
                                            setState(() {});

                                            var res = await api.deleteAddress(
                                                snapshot.data[index]["ID"]);
                                            print(res);
                                            if (snapshot.data[index]["ID"] !=
                                                null) {
                                              //Map<String, dynamic> data = jsonDecode(res.body);

                                            }
                                          },
                                        ),
                                        Text("ยกเลิกคำสั่งซื้อ",
                                            maxLines: 2,
                                            overflow: TextOverflow.fade,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 1),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
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
