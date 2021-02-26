import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:hello/Product/models/shoe_model.dart';
import '../../Homepage/home_page.dart';

class Onitsuka_Tiger extends StatefulWidget {

  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Onitsuka_Tiger> {
  List<ShoeModel> shoeList = ShoeModel.list;
  LocalStorage storage2;
  var Product;

  @override
  void initState() {
    storage2 = LocalStorage('Product');
    Product = storage2.getItem('data');
  }

  @override
  Widget build(BuildContext context) {
    var onPressed;
    List menu = [
      {

        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder:(context) => HomePage()),

          );
        },
        'name': '${Product[2]}',
        "price": "฿ ${Product[3]}",
        "image": "assets/imgOnitsuka_Tiger/Onitsuka Tiger2.jfif",
        "Description": '',
      },
      {

        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder:(context) => HomePage()),
          );
        },
        'name': '${Product[6]}',
        "price": "฿ ${Product[7]}",
        "image": "assets/imgOnitsuka_Tiger/Onitsuka Tiger2.jfif",
        "Description": ''
      },


      {

        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder:(context) => HomePage()),
          );
        },
        'name': '${Product[10]}',
        "price": "฿ ${Product[11]}",
        "image": "assets/imgOnitsuka_Tiger/Onitsuka Tiger4.jfif",
        "Description": ''
      },
      {

        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder:(context) => HomePage()),
          );
        },
        'name': '${Product[14]}',
        "price": "฿ ${Product[15]}",
        "image": "assets/imgOnitsuka_Tiger/Onitsuka Tiger5.jfif",
        "Description": ''
      },
      {

        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder:(context) => HomePage()),
          );
        },
        'name': '${Product[18]}',
        "price": "฿ ${Product[19]}",
        "image": "assets/imgOnitsuka_Tiger/Onitsuka Tiger6.jfif",
        "Description": ''
      },
      {

        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder:(context) => HomePage()),
          );
        },
        'name': '${Product[6]}',
        "price": "฿ ${Product[7]}",
        "image": "assets/imgOnitsuka_Tiger/Onitsuka Tiger7.jfif",
        "Description": ''
      },




    ];




    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "Onitsuka Tiger",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
        actions: [
          Icon(
            Icons.search,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[


                  ],
                ),
              ),

              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "JUST FOR YOU",
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "VIEW ALL",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              ...shoeList.map((data) {
                return GestureDetector(

                  child: Container(
                    margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          spreadRadius: 1,
                          blurRadius: 10,
                        ),
                      ],
                    ),
                    child: Row(
                      children: <Widget>[
                        Image(
                          image: AssetImage("assets/${data.imgPath}"),
                          width: 100,
                          height: 60,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Text(
                                  "${data.name}",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "${data.brand}",
                                style: TextStyle(
                                  color: Colors.black26,
                                  height: 1.5,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Text(
                            "\$${data.price.toInt()}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),
        ],
      ),
    );
  }
}
