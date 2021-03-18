import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:Shopper/model/User.dart';
import 'package:provider/provider.dart';
import 'package:Shopper/api/user_api.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Profile.dart';

class MyHomePage extends StatefulWidget {
  final formKey = GlobalKey<FormState>();

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;
  final picker = ImagePicker();
  userApi api = userApi();

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    TextEditingController NameController = TextEditingController();
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Text('แก้ไขข้อมูลส่วนตัว'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150, vertical: 5),
              child: CircleAvatar(
                radius: 60.0,
                backgroundImage: _image == null
                    ? AssetImage("assets/images/AAA.png")
                    : FileImage(File(_image.path)),
              ),
            ),
            TextFormField(
              controller: NameController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.account_box),
                  labelText: 'กรุณาใส่ชื่อที่ต้องการเปลื่ยน',
                  fillColor: Colors.white,
                  border: InputBorder.none),
            ),
            // ignore: deprecated_member_use
            RaisedButton(
              onPressed: () async {
                var res = await api.upload(
                  _image,
                  user.Id.toString(),
                  NameController.text,
                );
                if (res.statusCode == 200) {
                  print("upload success");
                  var res = await api.getUser(user.Id.toString());
                  if (res.statusCode == 200) {
                    Map<String, dynamic> data = jsonDecode(res.body);
                    print("yes");

                    User statement = User(
                        Id: data['ID'],
                        Username: data['Username'],
                        Password: data['Password'],
                        Email: data['Email'],
                        PhoneNumber: data['PhoneNumber'],
                        Name: data['Name'],
                        Image: data['Image']);

                    provider.addUser(statement);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Page1();
                    }));
                  }
                }
              },
              color: Colors.deepOrange,
              child: Text(
                'ยืนยัน',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.black,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 50.0,
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto2(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void takePhoto2(ImageSource source) async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
}
