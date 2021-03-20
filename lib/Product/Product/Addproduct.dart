import 'dart:io';
import 'package:Shopper/Homepage/BottomNavigation.dart';
import 'package:Shopper/api/product_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Addproduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Addproduct();
  }
}

class _Addproduct extends State<Addproduct> {
  String dropdownValue = 'Nike';
  final picker = ImagePicker();
  File _image;
  // ignore: non_constant_identifier_names
  int PriceController;
  productApi api = productApi();

  @override
  Widget build(BuildContext context) {
    // ignore: non_constant_identifier_names
    TextEditingController NameproductController = TextEditingController();
    // ignore: non_constant_identifier_names
    TextEditingController InformationController = TextEditingController();
    // ignore: non_constant_identifier_names
    TextEditingController PriceController = TextEditingController();

    TextEditingController BrandController = TextEditingController();
    TextEditingController stockController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Addproduct"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 1),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: _image == null
                  ? Image.asset("assets/images/air-max-90.jpg")
                  : Image.file(File(_image.path)),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String newValue) {
                setState(() {
                  dropdownValue = newValue;
                  print(dropdownValue);
                });
              },
              items: <String>[
                'Nike',
                'Converse',
                'Puma',
                'Adidas',
                'Vans',
                'Newbalance'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15.0),
            child: TextFormField(
              controller: NameproductController,
              decoration: new InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  labelText: "กรุณาป้อนชื่อProduct",
                  labelStyle: TextStyle(color: Colors.black38)),
              autofocus: true,
              enabled: true,
              validator: (String str) {
                //ชื่อรายการเป็นค่าว่าง
                if (str.isEmpty) {
                  return "กรุณาป้อนชื่อProduct";
                }
                return null;
              },
            ),
          ),
          //
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: InformationController,
              decoration: new InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  labelText: "กรุณาป้อนข้อมูลProduct",
                  labelStyle: TextStyle(color: Colors.black38)),
              autofocus: true,
              enabled: true,
              cursorColor: Colors.redAccent,
              validator: (String str) {
                if (str.isEmpty) {
                  return "กรุณาป้อนข้อมูลProduct";
                }

                return null;
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: PriceController,
              decoration: new InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  labelText: "กรุณาป้อนราคาProduct",
                  labelStyle: TextStyle(color: Colors.black38)),
              autofocus: true,
              enabled: true,
              validator: (String str) {
                if (str.isEmpty) {
                  return "กรุณาป้อนราคาProduct";
                }

                return null;
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextFormField(
              controller: stockController,
              decoration: new InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.black38),
                  ),
                  labelText: "กรุณาป้อนจำนวนstock",
                  labelStyle: TextStyle(color: Colors.black38)),
              autofocus: true,
              enabled: true,
              validator: (String str) {
                if (str.isEmpty) {
                  return "กรุณาป้อนจำนวนstock";
                }

                return null;
              },
            ),
          ),
          // ignore: deprecated_member_use
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: MaterialButton(
              onPressed: () async {
                var res = await api.uploadproduct(
                    _image,
                    NameproductController.text,
                    InformationController.text,
                    PriceController.text,
                    dropdownValue.toString(),
                    stockController.text);

                print(res.statusCode);

                if (res.statusCode == 200) {
                  //Map<String, dynamic> data = jsonDecode(res.body);
                  print("yes");

                  Alert(
                    context: context,
                    type: AlertType.success,
                    title: "เพิ่มสินค้าสำเร็จ",
                    desc: "",
                    buttons: [
                      DialogButton(
                          child: Text(
                            "OK",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () => Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return Bottomnavigations(
                                  selectedIndex: 0,
                                );
                              })))
                    ],
                  ).show();
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
          ),
        ],
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
              icon: Icon(
                Icons.camera,
                color: Colors.black,
              ),
              onPressed: () {
                takePhoto2(ImageSource.camera);
              },
              label: Text(
                "Camera",
                style: TextStyle(color: Colors.black),
              ),
            ),
            TextButton.icon(
              icon: Icon(
                Icons.image,
                color: Colors.black,
              ),
              onPressed: () {
                takePhoto(ImageSource.gallery);
              },
              label: Text(
                "Gallery",
                style: TextStyle(color: Colors.black),
              ),
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
