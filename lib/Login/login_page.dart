import 'package:Shopper/api/user_api.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Homepage/BottomNavigation.dart';
import '../Register/regi_page.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

TextEditingController UserController = TextEditingController();
TextEditingController PassController = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, {bool isPassword = true}) {
    userApi api = userApi();
    return Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/promotion_sneaker3.jpg'))),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.all(40.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset('assets/images/logo.png'),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextFormField(
                          controller: UserController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_box),
                              labelText: 'Username',
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none),
                          validator: (String str) {
                            if (str.isEmpty) {
                              return "กรุณาป้อนUsername";
                            }
                            return null;
                          },
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        TextFormField(
                          obscureText: isPassword,
                          controller: PassController,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              labelText: 'Password',
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none),
                          validator: (String str) {
                            if (str.isEmpty) {
                              return "กรุณาป้อนPassword";
                            }
                            return null;
                          },
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        // ignore: deprecated_member_use
                        RaisedButton(
                          onPressed: () async {
                            if (formKey.currentState.validate()) {
                              var user = UserController.text;
                              var pass = PassController.text;
                              var res = await api.login(user, pass);

                              if (res.statusCode == 200) {
                                Map<String, dynamic> data =
                                    jsonDecode(res.body);
                                print(data);

                                User statement = User(
                                  Id: data['ID'],
                                  Username: data['Username'],
                                  Password: data['Password'],
                                  Email: data['Email'],
                                  PhoneNumber: data['PhoneNumber'],
                                  Name: data['Name'],
                                  Image: data['Image'],
                                  Coin: data['Coin'],
                                  Airpay: data['Airpay'],
                                  Admin: data['Admin'],
                                );

                                var provider = Provider.of<UserProvider>(
                                    context,
                                    listen: false);
                                provider.addUser(statement);
                                Alert(
                                  context: context,
                                  type: AlertType.success,
                                  title: "เข้าสู่ระบบสำเร็จ",
                                  desc: "",
                                  buttons: [
                                    DialogButton(
                                        child: Text(
                                          "OK",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                        onPressed: () => Navigator.push(context,
                                                MaterialPageRoute(
                                                    builder: (context) {
                                              return Bottomnavigations(
                                                selectedIndex: 0,
                                              );
                                            })))
                                  ],
                                ).show();
                              } else {
                                Alert(
                                  context: context,
                                  type: AlertType.error,
                                  title: "LoginFalile",
                                  desc: "",
                                  buttons: [
                                    DialogButton(
                                      child: Text(
                                        "Close",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () => Navigator.pop(context),
                                      width: 120,
                                    )
                                  ],
                                ).show();
                              }
                            }
                          },
                          color: Colors.black,
                          child: Text(
                            '                 Login to app                   ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegPage()),
                            );
                          },
                          color: Colors.red,
                          child: Text(
                            '                 New Register                   ',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ));
  }
}
