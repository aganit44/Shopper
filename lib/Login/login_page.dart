import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../Homepage/BottomNavigation.dart';
import 'package:http/http.dart' as http;
import 'Model/userModel.dart';
import '../Register/regi_page.dart';
import 'dart:convert';
import 'package:hello/api/user_api.dart';

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
    var res;
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
                        Image.network(
                            'https://scontent.xx.fbcdn.net/v/t1.15752-0/p206x206/151655500_466774074691188_845261356064583738_n.png?_nc_cat=101&ccb=3&_nc_sid=50854b&_nc_ohc=n2IaNaEaJpwAX_r5pYy&_nc_ad=z-m&_nc_cid=0&_nc_ht=scontent.xx&_nc_tp=30&oh=22b80a8461ddf553798e45f32a1e7c6f&oe=605D14DF'),
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
                          onPressed: () {
                            var user = UserController.text;
                            var pass = PassController.text;
                            res = api.login(user, pass);
                            //print(res);
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
