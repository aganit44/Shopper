import 'package:Shopper/model/User.dart';
import 'package:flutter/foundation.dart';

class UserProvider with ChangeNotifier {
  User user;

  User getUser() {
    return user;
  }

  void addUser(User statement) {
    user = statement;
    notifyListeners();
  }
}
