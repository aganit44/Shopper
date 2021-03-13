import 'dart:io';
import 'package:Shopper/Homepage/BottomNavigation.dart';
import 'package:Shopper/api/product_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class Editproduct extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Editproduct();
  }
}

class _Editproduct extends State<Editproduct> {
  String dropdownValue = 'Nike';
  final picker = ImagePicker();
  File _image;
  productApi api = productApi();

  @override
  Widget build(BuildContext context) {
    // var provider = Provider.of<ProductProvider>(context, listen: false);
    // Product product = provider.getProduct();
    TextEditingController NameproductController = TextEditingController();
    TextEditingController InformationController = TextEditingController();
    TextEditingController PriceController = TextEditingController();
    TextEditingController BrandController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Editproduct"),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 75, vertical: 1),
            child: Container(
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
              decoration:
                  new InputDecoration(labelText: "กรุณาป้อนชื่อProduct"),
              autofocus: true,
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
              decoration:
                  new InputDecoration(labelText: "กรุณาป้อนข้อมูลProduct"),
              autofocus: true,
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
              decoration:
                  new InputDecoration(labelText: "กรุณาป้อนราคาProduct"),
              autofocus: true,
              validator: (String str) {
                if (str.isEmpty) {
                  return "กรุณาป้อนราคาProduct";
                }

                return null;
              },
            ),
          ),

          // ignore: deprecated_member_use
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: RaisedButton(
              // onPressed: () async {
              //   var res = await api.uploadproduct(
              //     _image,
              //     NameproductController.text,
              //     InformationController.text,
              //     PriceController.text,
              //     dropdownValue.toString(),
              //   );
              //   print(res.statusCode);

              //   if (res.statusCode == 200) {
              //     //Map<String, dynamic> data = jsonDecode(res.body);
              //     print("yes");

              //     Alert(
              //       context: context,
              //       type: AlertType.success,
              //       title: "เพิ่มสินค้าสำเร็จ",
              //       desc: "",
              //       buttons: [
              //         DialogButton(
              //             child: Text(
              //               "OK",
              //               style: TextStyle(color: Colors.white, fontSize: 20),
              //             ),
              //             onPressed: () => Navigator.push(context,
              //                     MaterialPageRoute(builder: (context) {
              //                   return Bottomnavigations(
              //                     selectedIndex: 0,
              //                   );
              //                 })))
              //       ],
              //     ).show();
              //   }
              // },
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
            size: 25.0,
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
            FlatButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {
                takePhoto2(ImageSource.camera);
              },
              label: Text("Camera"),
            ),
            FlatButton.icon(
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
