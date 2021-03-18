import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HeaderContainer extends StatelessWidget {
  var text = "Login";

  HeaderContainer(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: MediaQuery.of(context).size.height * 0.5,

      child: Stack(
        children: <Widget>[
          Center(
            child: Image.asset('assets/images/promotion_sneaker3.png'),
          ),
        ],
      ),
    );
  }
}
