import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BannerSlider6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      overflow: Overflow.visible,
      alignment: Alignment.bottomCenter,
      children: [

        BannerSection6(),

      ],
    );
  }
}

class BannerSection6 extends StatefulWidget {
  @override
  _BannerSectionState createState() => _BannerSectionState();
}

class _BannerSectionState extends State<BannerSection6> {
  final List<String> _imgList = [
    'assets/images/OnitsukaTiger.jpg',
    'assets/images/OnitsukaTiger3.jpg',
    'assets/images/OnitsukaTiger3.jpg',
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




