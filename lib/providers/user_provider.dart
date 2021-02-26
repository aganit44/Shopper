import 'package:flutter/foundation.dart';
import 'package:hello/model/User.dart';

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
