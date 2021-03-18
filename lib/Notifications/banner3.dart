import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerSlider5 extends StatefulWidget {
  @override
  _BannerSlider5State createState() => _BannerSlider5State();
}

class _BannerSlider5State extends State<BannerSlider5> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      // ignore: deprecated_member_use
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: [
        BannerSection(),
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
    'assets/images/212.jpg',
    'assets/images/213.png',
    'assets/images/214.jpg',
    'assets/images/215.png',
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
      width: 600,
      height: 1000,
      child: CarouselSlider(
        options: CarouselOptions(
            aspectRatio: 0.1,
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
