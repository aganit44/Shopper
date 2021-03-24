import 'package:Shopper/Homepage/BottomNavigation.dart';
import 'package:Shopper/Notifications/detail_user.dart';
import 'package:Shopper/api/product_api.dart';
import 'package:Shopper/api/user_api.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddData extends StatefulWidget {
  Map<dynamic, dynamic> id;
  AddData({@required this.id});
  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  userApi api = userApi();
  productApi api2 = productApi();

  TextEditingController controllerAddress = TextEditingController();
  TextEditingController controllerDistrict = TextEditingController();
  TextEditingController controllerProvince = TextEditingController();
  TextEditingController controllerPinCode = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    return new Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () =>
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Bottomnavigations(
                      selectedIndex: 0,
                    );
                  }))),
          title: new Text("Derivery"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: ListView(
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Where are your ordered items shipped?",
                      style: TextStyle(color: Colors.black87, fontSize: 22),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    new TextFormField(
                      controller: controllerAddress,
                      decoration: new InputDecoration(
                          hintText: "Address", labelText: "Address"),
                      validator: (String str) {
                        if (str.isEmpty) {
                          return "กรุณาป้อนข้อมูลให้ครบ";
                        }
                        return null;
                      },
                    ),
                    new TextFormField(
                      controller: controllerDistrict,
                      decoration: new InputDecoration(
                          hintText: "District", labelText: "District"),
                      validator: (String str) {
                        if (str.isEmpty) {
                          return "กรุณาป้อนข้อมูลให้ครบ";
                        }
                        return null;
                      },
                    ),
                    new TextFormField(
                      controller: controllerProvince,
                      decoration: new InputDecoration(
                          hintText: "Province ", labelText: "Province "),
                      validator: (String str) {
                        if (str.isEmpty) {
                          return "กรุณาป้อนข้อมูลให้ครบ";
                        }
                        return null;
                      },
                    ),
                    new TextFormField(
                      controller: controllerPinCode,
                      decoration: new InputDecoration(
                          hintText: "PinCode", labelText: "PinCode"),
                      validator: (String str) {
                        if (str.isEmpty) {
                          return "กรุณาป้อนข้อมูลให้ครบ";
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    RaisedButton(
                      child: Text("สั่งซื้อ"),
                      color: Colors.orange,
                      onPressed: () async {
                        if (formKey.currentState.validate()) {
                          var res2 = await api2.addaddress(
                            user.Id,
                            widget.id['ID'],
                            controllerAddress.text,
                            controllerDistrict.text,
                            controllerProvince.text,
                            controllerPinCode.text,
                            widget.id['Images'],
                          );
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return detailluser(iduser2: user.Id);
                          }));
                        } else {}

                        print(widget.id);
                        // var res = await api.Updatdetaill(
                        //     controllerAddress.text,
                        //     controllerDistrict.text,
                        //     controllerProvince.text,
                        //     controllerPinCode.text,
                        //     user.Id.toString());
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
