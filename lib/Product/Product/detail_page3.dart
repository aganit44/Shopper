import 'package:Shopper/Product/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:localstorage/localstorage.dart';
import 'dart:convert';
import 'package:http/http.dart';
class DetailPage3 extends StatefulWidget {


  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage3> {
  LocalStorage localStorage;

  @override
  void initState() {
    localStorage = LocalStorage('Product');
    super.initState();
  }
  Future<dynamic> _ProductData() async {
    String url = "http://25.46.25.35/login/Product.php";
    var response = await get(url);
    if (response.statusCode == 200) {
      if (response.body.isNotEmpty) {
        var data = jsonDecode(response.body);

        return data;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("OnitsukaTiger"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          Icon(
            Icons.shopping_basket,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .65,
                width: MediaQuery.of(context).size.width,
                child: ClipPath(
                  clipper: AppClipper(
                    cornerSize: 50,
                    diagonalHeight: 180,
                    roundedBottom: false,
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 180, left: 16, right: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          width: 300,
                          // child: Text(
                          //   "${widget.shoeModel.name}",
                          //   style: TextStyle(
                          //     fontSize: 32,
                          //   ),
                          // ),
                        ),
                        
                        SizedBox(height: 1),
                        _buildRating(),
                        SizedBox(height: 1),

                        SizedBox(height: 1),
                        // Text(
                        //   "${widget.shoeModel.desc}",
                        //   style: TextStyle(
                        //     color: Colors.black38,
                        //   ),
                        // ),
                        SizedBox(height: 10),
                        Text(
                          "ข้อมูลสินค้า",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        FutureBuilder(
                          future: _ProductData(),
                          builder: (BuildContext context,AsyncSnapshot snapshot){
                            if(snapshot.hasData){
                              localStorage.setItem('Productlist',snapshot.data);
                              var data = localStorage.getItem('Productlist');
                              return Text('${data[2]['Productinformation']}',

                              );
                            }
                            else if (snapshot.hasError){
                              return CircularProgressIndicator();
                            }
                            else{
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                        SizedBox(height: 16),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              child: _buildBottom(),
            ),
            Padding(

              padding: const EdgeInsets.only(top: 25),


              // tag: "hero${widget.shoeModel.imgPath}",
              child: Transform.rotate(
                angle: -math.pi / -7,
                child:
                FutureBuilder(
                  future: _ProductData(),
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                    if(snapshot.hasData){
                      localStorage.setItem('Productlist',snapshot.data);
                      var data = localStorage.getItem('Productlist');
                      return Image.network('${data[0]['Images']}',

                      );
                    }
                    else if (snapshot.hasError){
                      return CircularProgressIndicator();
                    }
                    else{
                      return CircularProgressIndicator();
                    }
                  },
                ),
                // Image(
                //   width: MediaQuery.of(context).size.width * .85,
                //   image: AssetImage("assets/${widget.shoeModel.imgPath}"),
                // ),
              ),
            ),

          ],
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 10,
          )
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "PRICE",
                style: TextStyle(
                  color: Colors.black26,
                ),
              ),
              FutureBuilder(
                future: _ProductData(),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                  if(snapshot.hasData){
                    localStorage.setItem('Productlist',snapshot.data);
                    var data = localStorage.getItem('Productlist');
                    return Text('${data[1]['Price']}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        )
                    );
                  }
                  else if (snapshot.hasError){
                    return CircularProgressIndicator();
                  }
                  else{
                    return CircularProgressIndicator();
                  }
                },
              ),
              // Text(
              //   "\$${widget.shoeModel.price.toInt()}",
              //   style: TextStyle(
              //     fontWeight: FontWeight.bold,
              //     fontSize: 28,
              //   ),
              // ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 50,
            ),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Text(
              "ADD CART",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorOption(Color color) {
    return Container(
      width: 20,
      height: 20,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
    );
  }

  Widget _buildRating() {
    return Row(
      children: <Widget>[

        SizedBox(width: 16),
        Text(
          "134 Reviews",
          style: TextStyle(
            color: Colors.black26,
          ),
        )
      ],
    );
  }
}
