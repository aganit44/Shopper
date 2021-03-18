import 'package:Shopper/model/User.dart';
import 'package:Shopper/providers/user_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BannerSlider extends StatefulWidget {
  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: deprecated_member_use
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: [
        BannerSection(),
        CashInfo(),
      ],
    );
  }
}

class BannerSection extends StatefulWidget {
  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection> {
  final List<String> _imgList = [
    'assets/images/banner_1.jpg',
    'assets/images/banner_2.jpg',
    'assets/images/banner_3.jpg',
    'assets/images/banner_4.jpg',
  ];

  int _cueernt;

  @override
  void initState() {
    _cueernt = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBanner(),
        _buildIndicator(),
      ],
    );
  }

  Container buildBanner() {
    return Container(
      margin: EdgeInsets.only(bottom: 65),
      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
            aspectRatio: 1.873,
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {
                _cueernt = index;
              });
            }),
        items: _imgList
            .map(
              (item) => Image.asset(
                item,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            )
            .toList(),
      ),
    );
  }

  _buildIndicator() => Positioned(
        top: 1,
        left: 1,
        child: Row(
          children: _imgList.map(
            (url) {
              int index = _imgList.indexOf(url);
              return Container(
                width: 8,
                height: _cueernt == index ? 8 : 1,
                margin: EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  shape:
                      _cueernt == index ? BoxShape.circle : BoxShape.rectangle,
                ),
              );
            },
          ).toList(),
        ),
      );
}

class CashInfo extends StatefulWidget {
  @override
  _CashInfoState createState() => _CashInfoState();
}

class _CashInfoState extends State<CashInfo> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<UserProvider>(context, listen: false);
    User user = provider.getUser();
    final verticalDivider = VerticalDivider(
      indent: 5,
      endIndent: 5,
      width: 24,
      color: Colors.grey[300],
    );
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(4),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0.2,
              blurRadius: 7,
              offset: Offset(0, 1),
            )
          ]),
      child: IntrinsicHeight(
        child: Row(
          children: [
            SizedBox(width: 3),
            verticalDivider,
            _buildInfo(
              image: "assets/logo/Airpay.png",
              title: '${user.Airpay} Coin',
              subTitle: "by Dev from Home รับโค๊ดส่งฟรี 100 ต่อเดือน",
            ),
            verticalDivider,
            _buildInfo(
              image: "assets/logo/coin.jpg",
              title: '${user.Coin.toString()} Coin',
              subTitle: "นำ coin มาแลกหัวใจ ",
            ),
          ],
        ),
      ),
    );
  }

  _buildInfo(
      {String image, String title, String subTitle, bool isCoin = false}) {
    final height = 22.0;
    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height,
            child: Row(
              children: [
                Image.asset(
                  image,
                  height: isCoin ? height - 7.0 : null,
                  color: isCoin ? Colors.amber : null,
                ),
                SizedBox(width: 4),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
                //Text(title),
              ],
            ),
          ),
          Text(
            subTitle,
            style: TextStyle(
              fontSize: 11,
              color: Colors.grey[700],
            ),
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}
