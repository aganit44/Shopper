import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

// ignore: camel_case_types
class productApi {
  Future<dynamic> uploadproduct(File imageFile, String name, String information,
      String price, String brand, String stock) async {
    // open a bytestream
    var stream =
        // ignore: deprecated_member_use
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
    request.fields['Stock'] = stock;

    // send
    var response = await request.send();

    return response;
  }

  Future<dynamic> getproduct(String brand) async {
    var url = 'http://192.168.43.200:5000/product/select?brand=' + brand;
    var res = await http.get(url);
    return res;
  }

  // ignore: non_constant_identifier_names
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

  Future<dynamic> addaddress(
    int usersID,
    int prosID,
    String address,
    String district,
    String province,
    String pinCode,
    String images,
  ) async {
    print(address);
    // open a bytestream

    // string to uri
    var uri = Uri.parse('http://192.168.43.200:5000/product/Addaddress');

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    request.fields['UsersID'] = usersID.toString();
    request.fields['ProsID'] = prosID.toString();
    request.fields['Address'] = address.toString();
    request.fields['District'] = district.toString();
    request.fields['Province'] = province.toString();
    request.fields['PinCode'] = pinCode.toString();
    request.fields['Images'] = images.toString();

    print(prosID);
    var response = await request.send();

    return response;
  }

  Future<dynamic> deleteproduct(int proID) async {
    var url = 'http://192.168.43.200:5000/basket/deletebasket?ProID=' +
        proID.toString();
    var res = await http.get(url);
    return res;
  }

  Future<dynamic> deleteAddress(int id) async {
    var url =
        'http://192.168.43.200:5000/basket/deleteAddress?ID=' + id.toString();
    var res = await http.get(url);
    return res;
  }

  Future<dynamic> deleteproductAdmin(int proID) async {
    var url = 'http://192.168.43.200:5000/basket//deleteProduct?ID=' +
        proID.toString();
    var res = await http.get(url);
    return res;
  }

  Future<dynamic> updatestock(int stock, String id) async {
    var uri = Uri.parse("http://192.168.43.200:5000/product/Stock");

    var request = new http.MultipartRequest("POST", uri);

    request.fields['ID'] = id;
    request.fields['Stock'] = stock.toString();

    var response = await request.send();
    print(response.statusCode);

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });

    return response;
  }

  Future<dynamic> updateconfirm(String staTus, String id) async {
    var uri = Uri.parse("http://192.168.43.200:5000/basket/Updatconfirm");

    var request = new http.MultipartRequest("POST", uri);

    request.fields['StaTus'] = staTus;
    request.fields['ID'] = id;
    var response = await request.send();
    print(response.statusCode);

    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });

    return response;
  }

  // ignore: non_constant_identifier_names
  Future<dynamic> Editproduct(
      File imageFile,
      String name,
      String information,
      // ignore: non_constant_identifier_names
      String price,
      String brand,
      String stock,
      // ignore: non_constant_identifier_names
      String ID) async {
    var uri = Uri.parse("http://192.168.43.200:5000/product/EditProduct");
    var request = new http.MultipartRequest("POST", uri);
    // open a bytestream
    if (imageFile == null) {
      request.fields['Name'] = name;
      request.fields['information'] = information;
      request.fields['price'] = price;
      request.fields['Brand'] = brand;
      request.fields['Stock'] = stock;
      request.fields['ID'] = ID;
      var response = await request.send();
      return response;
    } else {
      var stream =
          // ignore: deprecated_member_use
          new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      // get file length
      var length = await imageFile.length();

      // string to uri

      // create multipart request

      // multipart that takes file
      var multipartFile = new http.MultipartFile('myFile', stream, length,
          filename: basename(imageFile.path));

      // add file to multipart
      request.files.add(multipartFile);
      request.fields['Name'] = name;
      request.fields['information'] = information;
      request.fields['price'] = price;
      request.fields['Brand'] = brand;
      request.fields['Stock'] = stock;
      request.fields['ID'] = ID;

      // send
      var response = await request.send();

      return response;
    }
  }
}
