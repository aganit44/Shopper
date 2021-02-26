import 'package:flutter/foundation.dart';
import 'package:hello/model/User.dart';

class User with ChangeNotifier {
  List<User> user = [];

  List<User> getUser() {
    return user;
  }

  void addUser(User statement) {
    user.add(statement);
    notifyListeners();
  }
}
