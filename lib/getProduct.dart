import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

class UserProduct extends ChangeNotifier {
  UserProduct({this.Product});



  List<dynamic> Product;
  Future<List> getProduct(BuildContext context) async {
    var url = 'http://25.46.25.35/login/Product.php';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var data = response.body;

      List<String> datauser = data.split("<br />");

      Product = datauser;
      print(Product[0]);
      print(Product[1]);
      print(Product[2]);
      print(Product[3]);
      return Product;
    }
  }
}
