import 'package:http/http.dart' as http;
import 'package:localstorage/localstorage.dart';

LocalStorage storage = LocalStorage('user');
LocalStorage storage2 = LocalStorage('Product');
void main(List<String> arguments) {
  getUser('Admin', '12345');
}

class User {
  final String ID;
  final String Username;
  final String Images;
  final String Password;
  final String Email;
  final String PhoneNumber;
  final String Name;
  final String Coin;

  User(this.ID, this.Username, this.Images, this.Password, this.Email,
      this.PhoneNumber, this.Name, this.Coin);
}

Future<List<User>> getUser(String username, String password) async {
  var url = 'http://25.46.25.35/login/login.php?username=' +
      username +
      '&password=' +
      password;

  // Await the http get response, then decode the json-formatted response.
  var response = await http.get(url);

  if (response.statusCode == 200) {
    var data = response.body;

    List<String> datauser = data.split("<br />");
    User user = User(
      datauser[0],
      datauser[1],
      datauser[2],
      datauser[3],
      datauser[4],
      datauser[5],
      datauser[6],
      datauser[7],
    );

  }
}
