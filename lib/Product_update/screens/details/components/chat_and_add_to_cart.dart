import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class ChatAndAddToCart extends StatelessWidget {
  const ChatAndAddToCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(kDefaultPadding),
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultPadding / 2,
      ),
      decoration: BoxDecoration(
        color: Color(0xFF000000),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        children: <Widget>[
          // ignore: deprecated_member_use
          FlatButton.icon(
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: SvgPicture.asset(
              "assets/icons/shopping-bag.svg",
              height: 18,
            ),
            label: Text(
              "BACK",
              style: TextStyle(color: Colors.white),
            ),
          ),
          // it will cover all available spaces
          Spacer(),
          // ignore: deprecated_member_use
          FlatButton.icon(
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            /*onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnitsukaTiger1()),
              );
            },*/
            icon: SvgPicture.asset(
              "assets/icons/shopping-bag.svg",
              height: 18,
            ),
            label: Text(
              "ซื้อสินค้า",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
