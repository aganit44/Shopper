import 'dart:convert';

import 'package:Shopper/api/product_api.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Drawer2 extends StatefulWidget {
  int iduser;
  Drawer2({this.iduser});

  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<Drawer2> {
  int iduser = 0;
  productApi api = productApi();

  @override
  void initState() {
    iduser = widget.iduser;
    super.initState();
  }

  Future getproduct() async {
    try {
      var response = await http.get(
          'http://192.168.43.200:5000/basket/selectbasket?ID=' +
              iduser.toString());

      return json.decode(response.body);
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            child: DrawerHeader(
                padding: EdgeInsets.zero,
                child: ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(SimpleLineIcons.basket),
                      Text(
                        '  Cart',
                        style: Theme.of(context).textTheme.title,
                      ),
                    ],
                  ),
                  onTap: () {},
                )),
          ),

          Flexible(
            child: FutureBuilder(
              builder: (context, snapshot) {
                if (ConnectionState.active != null && !snapshot.hasData) {
                  return Center(child: Text("ไม่มีสินค้าในตะกร้า"));
                }

                if (ConnectionState.done != null && snapshot.hasError) {
                  return Center(child: Text(snapshot.error));
                }

                return ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
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
                        padding:
                            EdgeInsets.symmetric(vertical: 1, horizontal: 25),
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
                                            child: Text(
                                              "     \$${snapshot.data[index]["Price"]}",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 1),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.delete_forever_outlined,
                                              ),
                                              iconSize: 30,
                                              color: Colors.red,
                                              splashColor: Colors.purple,
                                              onPressed: () async {
                                                setState(() {});
                                                var res =
                                                    await api.deleteproduct(
                                                        snapshot.data[index]
                                                            ["ID"]);
                                                print(res);
                                                if (snapshot.data[index]
                                                        ["ID"] !=
                                                    null) {
                                                  //Map<String, dynamic> data = jsonDecode(res.body);

                                                }
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 1),
                                            child: IconButton(
                                              icon: Icon(
                                                Icons.monetization_on,
                                              ),
                                              iconSize: 30,
                                              color: Colors.yellowAccent[700],
                                              splashColor: Colors.purple,
                                              onPressed: () {},
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width * .6,
                                  child: Text(
                                    "   ${snapshot.data[index]["Name"]}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                ),
                              ],
                            ),
                          ],
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

          // const Expanded(child: CartContent())
        ],
      ),
    );
  }
}
