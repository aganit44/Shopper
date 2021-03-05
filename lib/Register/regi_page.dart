import 'package:Shopper/Login/login_page.dart';
import 'package:Shopper/api/user_api.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

TextEditingController UserController = TextEditingController();
TextEditingController PassController = TextEditingController();
TextEditingController EmailController = TextEditingController();
TextEditingController PhoneNumberController = TextEditingController();
TextEditingController NameController = TextEditingController();

class RegPage extends StatefulWidget {
  @override
  _RegPageState createState() => _RegPageState();
}

class _RegPageState extends State<RegPage> {
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
                    ),
                    TextField(
                      obscureText: isPassword,
                      controller: PassController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.vpn_key),
                          labelText: 'Pass',
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none),
                    ),
                    TextField(
                      controller: NameController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.people_rounded),
                          labelText: 'Name',
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none),
                    ),
                    TextFormField(
                      controller: EmailController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_box),
                          labelText: 'Email',
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none),
                    ),
                    TextFormField(
                      controller: PhoneNumberController,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'PhoneNumber',
                          filled: true,
                          fillColor: Colors.white,
                          border: InputBorder.none),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    RaisedButton(
                      onPressed: () async {
                        var res = await api.register(
                          UserController.text,
                          PassController.text,
                          EmailController.text,
                          PhoneNumberController.text,
                          NameController.text,
                        );
                        if (res.statusCode == 200) {
                          Alert(
                            context: context,
                            type: AlertType.success,
                            title: "สมัครสำเร็จ",
                            desc: "",
                            buttons: [
                              DialogButton(
                                  child: Text(
                                    "OK",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  onPressed: () => Navigator.push(context,
                                          MaterialPageRoute(builder: (context) {
                                        return LoginPage();
                                      })))
                            ],
                          ).show();
                        }
                      },
                      color: Colors.black,
                      child: Text(
                        '                 REGISTER                  ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _textInput(
      {controller, hint, icon, bool isPassword = true, Object pass}) {
    return Container(
      margin: EdgeInsets.only(top: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        color: Colors.white,
      ),
      padding: EdgeInsets.only(left: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          alignLabelWithHint: isPassword,
          prefixIcon: Icon(icon),
        ),
      ),
    );
  }
}
