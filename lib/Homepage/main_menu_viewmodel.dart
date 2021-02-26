import 'package:hello/Product/Product/Onitsuka Tiger1.dart';
import 'package:flutter/cupertino.dart';
import 'package:hello/Product/NewProduct/Nike/Nike.dart';
import 'package:hello/Product/NewProduct/Puma/Puma.dart';
import 'package:hello/Product/NewProduct/converse/converse.dart';
import 'package:hello/Product/NewProduct/Reebok/Reebok.dart';
import 'package:hello/Product/NewProduct/Adidas/Adidas.dart';
import 'package:hello/Product/NewProduct/Vans/Vans.dart';

class MainMenuModel{

  String title;

  String image;

  StatefulWidget function;


  MainMenuModel({this.title, this.image,this.function,});
}




class MainMenuViewModel {
  List<MainMenuModel> getMainMenu() {

    return [
      MainMenuModel(
          image: "assets/logo/Onitsuka.jpg",
          title: "Onitsuka Tiger",
          function: OnitsukaTiger2()
        //color: Colors.red,
      ),
      MainMenuModel(
          image: "assets/logo/nike.jpg",
        title: "Nike",
          function: Nike()          //color: Colors.red,://encrypt
      ),
      MainMenuModel(
        image:
        "assets/logo/converse.jpg",
        title: "converse",
          function: converse()        //color: Colors.red,
      ),
      MainMenuModel(

        image:
        "assets/logo/Puma.png",
        title: "PUMA",
          function: Puma()        //color: Colors.red,
      ),
      MainMenuModel(
        image:
            "assets/logo/adidas.png",
        title: "adidas",
          function: Adidas()        //color: Colors.red,
      ),
      MainMenuModel(
        image:
            "assets/logo/Vans.png",
        title: "Vans",
          function: Vans()        //color: Colors.red,
      ),

      MainMenuModel(
        image:
            "assets/logo/kedslogo.jpg",
        title: "Keds",
          function: OnitsukaTiger2()        //color: Colors.red,
      ),
      MainMenuModel(
        image:
            "assets/logo/Reebok.jpg",
        title: "Reebok",
          function: Reebok()        //color: Colors.red,
      ),
      MainMenuModel(
        image:
            "assets/logo/shop.png",
        title: "ตะกร้า",
          function: OnitsukaTiger2()        //color: Colors.red,
      ),
      MainMenuModel(
        image:
            "assets/logo/visa.jfif",
        title: "ATM",
          function: OnitsukaTiger2()        //color: Colors.red,
      ),


    ];
  }
}

