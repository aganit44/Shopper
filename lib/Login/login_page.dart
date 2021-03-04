import 'package:Shopper/api/user_api.dart';
import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Homepage/BottomNavigation.dart';
import '../Register/regi_page.dart';
import 'dart:convert';

import 'package:provider/provider.dart';

LocalStorage storage = LocalStorage('user');
LocalStorage storage2 = LocalStorage('Product');

//UserLogin userLogin = UserLogin();

TextEditingController UserController = TextEditingController();
TextEditingController PassController = TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  // Future<dynamic> Login() async {
  //   await userLogin.getUser(UserController.text, PassController.text, context);
  //   await storage.setItem('data', userLogin.user);
  // }

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
                                            color: Colors.white, fontSize: 20),
                                      ),
                                      onPressed: () =>   Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                            return Bottomnavigations(
                                              selectedIndex: 0,
                                            );

                                          }))
                                    )
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
                          color: Colors.deepOrange,
                          child: Text(
                            '                 New Register                   ',
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
                          color: Colors.indigo,
                          child: Text(
                            '              Login to facebook                   ',
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

// class UserLogin {
//   List<dynamic> user;

//   Future<List<User>> getUser(
//       String username, String password, BuildContext context) async {
//     /* if (username == '' || password == '') {
//       Alert(
//         context: context,
//         type: AlertType.error,
//         title: "กรุณากรอกUsernameและPassword",
//         desc: "",
//         buttons: [
//           DialogButton(
//             child: Text(
//               "Close",
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//             onPressed: () => Navigator.pop(context),
//             width: 120,
//           )
//         ],
//       ).show();
//       print("Falile");
//     }*/
//     // var url = 'http://25.46.25.35/login/login.php?username=' +
//     //     username +
//     //     '&password=' +
//     //     password;

//     var url = 'http://25.46.25.35:5000/login/' + username + '/' + password;

//     // Await the http get response, then decode the json-formatted response.
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       var data = jsonDecode(response.body);
//       print(data);
//       Alert(
//         type: AlertType.warning,
//         context: context,
//         title: "เข้าสู่ระบบสำเร็จ",
//         desc: "",
//         buttons: [
//           DialogButton(
//               child: Text(
//                 "OK",
//                 style: TextStyle(color: Colors.white, fontSize: 20),
//               ),
//               onPressed: () => Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                         builder: (context) => (Bottomnavigations())),
//                   ))
//         ],
//       ).show();
//       //}
//     } else if (response.statusCode == 400) {
//       Alert(
//         context: context,
//         type: AlertType.error,
//         title: "LoginFalile",
//         desc: "",
//         buttons: [
//           DialogButton(
//             child: Text(
//               "Close",
//               style: TextStyle(color: Colors.white, fontSize: 20),
//             ),
//             onPressed: () => Navigator.pop(context),
//             width: 120,
//           )
//         ],
//       ).show();
//     }
//   }
// }
