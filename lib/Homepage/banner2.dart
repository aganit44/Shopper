import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerSlider2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: [

        BannerSection2(),

      ],
    );
  }
}

class BannerSection2 extends StatefulWidget {
  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection2> {
  final List<String> _imgList = [
    'assets/images/sss.jpg',
    'assets/images/ssss.jpg',
    'assets/images/sssss.jpg',
  ];





  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        buildBanner(),

      ],
    );
  }

  Container buildBanner() {
    return Container(

      width: double.infinity,
      child: CarouselSlider(
        options: CarouselOptions(
            aspectRatio: 1.573,
            viewportFraction: 1.0,
            autoPlay: true,
            onPageChanged: (index, reason) {
              setState(() {

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


}




