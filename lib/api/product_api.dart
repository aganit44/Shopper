import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class productApi {
  Future<dynamic> uploadproduct(File imageFile, String name, String information,
      String price, String brand) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse("http://192.168.43.200:5000/product/uploadProduct");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['Name'] = name;
    request.fields['information'] = information;
    request.fields['price'] = price;
    request.fields['Brand'] = brand;

    // send
    var response = await request.send();

    return response;
  }

  Future<dynamic> getproduct(String brand) async {
    var url = 'http://192.168.43.200:5000/product/select?brand=' + brand;
    var res = await http.get(url);
    return res;
  }

  Future<dynamic> Userproduct(int userID, int proID) async {
    // open a bytestream

    // string to uri
    var uri = Uri.parse('http://192.168.43.200:5000/basket/addproduct');

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    request.fields['UserID'] = userID.toString();
    request.fields['ProID'] = proID.toString();

    var response = await request.send();

    return response;
  }

  // Future<dynamic> Userproduct(String UserID, String ProID) async {
  //   var url = 'http://192.168.43.200:5000/basket/addproduct=' +;
  //   var res = await http.get(url);
  //   return res;
}
