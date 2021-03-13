import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class userApi {
  Future<dynamic> login(String userName, String password) async {
    var url = 'http://192.168.43.200:5000/login/' + userName + '/' + password;
    var res = await http.get(url);
    return res;
  }

  Future<dynamic> register(String userName, String password, String email,
      String phoneNumber, String name) async {
    var url = 'http://192.168.43.200:5000/Resgister/' +
        userName +
        '/' +
        password +
        '/' +
        email +
        '/' +
        phoneNumber +
        '/' +
        name;
    var res = await http.get(url);
    return res;
  }

  Future<dynamic> upload(File imageFile, String uid, String name) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://192.168.43.200:5000/upload");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['ID'] = uid;
    request.fields['Name'] = name;

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });

    return response;
  }

  Future<dynamic> getUser(String ID) async {
    var url = 'http://192.168.43.200:5000/getuser/' + ID;
    print(url);
    var res = await http.get(url);
    return res;
  }

  Future<dynamic> coin(int coin, String id2) async {
    // open a bytestream

    var uri = Uri.parse("http://25.46.25.35:5000/Coin");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // add file to multipart
    request.fields['ID'] = id2;
    request.fields['Coin'] = coin.toString();

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });

    return response;
  }
}
