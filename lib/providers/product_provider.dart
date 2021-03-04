import 'package:Shopper/api/product_api.dart';
import 'package:Shopper/model/Product.dart';
import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  List<Product> product = [];
  productApi api = productApi();

  List<Product> getProduct() {
    return product;
  }

  // void initData() async {
  //   var res = await api.getproduct();
  //   print(res);
  //   // product = statement;
  //   notifyListeners();
  // }
}
