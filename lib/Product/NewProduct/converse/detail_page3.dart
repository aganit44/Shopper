import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:hello/Product/models/shoe_model.dart';
import 'package:hello/Product/widgets/app_clipper.dart';


class converse3 extends StatefulWidget {


  @override
  _converse3PageState createState() => _converse3PageState();
}

class _converse3PageState extends State<converse3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        title: Text("converse"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
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
                        SizedBox(height: 16),
                        _buildRating(),
                        SizedBox(height: 24),
                        Text(
                          "DETAILS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 16),
                        // Text(
                        //   "${widget.shoeModel.desc}",
                        //   style: TextStyle(
                        //     color: Colors.black38,
                        //   ),
                        // ),
                        SizedBox(height: 24),
                        Text(
                          "COLOR OPTIONS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: <Widget>[
                            _buildColorOption(Colors.orange),
                            _buildColorOption(Colors.orange),
                            _buildColorOption(Colors.orange),
                            _buildColorOption(Colors.orange),
                          ],
                        )
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
              padding: const EdgeInsets.only(top: 50),
              // child: Hero(
              //   tag: "hero${widget.shoeModel.imgPath}",
              //   child: Transform.rotate(
              //     angle: -math.pi / 7,
              //     child: Image(
              //       width: MediaQuery.of(context).size.width * .85,
              //       image: AssetImage("assets/${widget.shoeModel.imgPath}"),
              //     ),
              //   ),
              // ),
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
              color: Colors.black38,
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
