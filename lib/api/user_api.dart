import 'package:http/http.dart' as http;

class userApi {
  Future<String> login(String userName, String password) async {
    var url = 'http://25.46.25.35:5000/login/' + userName + '/' + password;

    var res = await http.get(url);

    print(res);

    return userName + "" + password;
  }
}
