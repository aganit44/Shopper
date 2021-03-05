// import 'package:hello/Product/Product/Onitsuka Tiger1.dart';
// import 'package:hello/Product/NewProduct/Nike/Nike.dart';
// import 'package:hello/Product/NewProduct/Puma/Puma.dart';
// import 'package:hello/Product/NewProduct/converse/converse.dart';
// import 'package:hello/Product/NewProduct/Reebok/Reebok.dart';
// import 'package:hello/Product/NewProduct/Adidas/Adidas.dart';
// import 'package:hello/Product/NewProduct/Vans/Vans.dart';
import 'package:Shopper/Product/Product/New.dart';
import 'package:Shopper/Product/Product/Onitsuka%20Tiger1.dart';
import 'package:flutter/cupertino.dart';

class MainMenuModel {
  String title;

  String image;

  StatefulWidget function;

  MainMenuModel({
    this.title,
    this.image,
    this.function,
  });
}

class MainMenuViewModel {
  List<MainMenuModel> getMainMenu() {
    return [
      MainMenuModel(
          image: "assets/logo/nike.jpg",
          title: "Nike",
          function: OnitsukaTiger2(
            brand: "nike",
          ) //color: Colors.red,://encrypt
          ),
      MainMenuModel(
          image: "assets/logo/converse.jpg",
          title: "converse",
          function: OnitsukaTiger2(brand: "converse") //color: Colors.red,
          ),
      MainMenuModel(
          image: "assets/logo/Puma.png",
          title: "PUMA",
          function: OnitsukaTiger2(brand: "PUMA") //color: Colors.red,
          ),
      MainMenuModel(
          image: "assets/logo/adidas.png",
          title: "adidas",
          function: OnitsukaTiger2(brand: "adidas") //color: Colors.red,
          ),
      MainMenuModel(
          image: "assets/logo/Vans.png",
          title: "Vans",
          function: OnitsukaTiger2(brand: "Vans") //color: Colors.red,
          ),
      MainMenuModel(
          image: "assets/logo/kedslogo.jpg",
          title: "Keds",
          function: OnitsukaTiger2(brand: "Keds") //color: Colors.red,
          ),
    ];
  }
}
