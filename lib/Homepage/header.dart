import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Header extends StatefulWidget {
  final TrackingScrollController scrollController;
  const Header(this.scrollController);
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color _backgroundColor;
  Color _backgroundColorSeach;
  Color _colorIcon;
  double _opacity;
  double _offset;

  final _opacityMax = 0.01;
  @override
  void initState() {
    _backgroundColor = Colors.transparent;
    _backgroundColorSeach = Colors.white;
    _colorIcon = Colors.white;
    _opacity = 0.0;
    _offset = 0.0;

    widget.scrollController.addListener(_onSroll);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _buildInputSerarch(),
              SizedBox(width: 8),
              _buildIconButton(
                onPressed: () => print("click!!"),
                icon: Icons.shopping_cart,
                notification: 20,
              ),
              _buildIconButton(
                onPressed: () => print("click!!"),
                icon: Icons.chat,
                notification: 9,
              ),
            ],
          ),
        ));
  }

  _buildInputSerarch() {
    final sizeIcon = BoxConstraints(
      minWidth: 40,
      minHeight: 40,
    );
    final border = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.transparent,
        width: 0,
      ),
      borderRadius: const BorderRadius.all(
        const Radius.circular(4.0),
      ),
    );

    return Expanded(
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(4),
          isDense: true,
          enabledBorder: border,
          focusedBorder: border,
          hintText: "Shopper",
          hintStyle: TextStyle(
            fontSize: 18,
            color: Colors.deepOrange,
          ),
          prefixIcon: Icon(Icons.search),
          prefixIconConstraints: sizeIcon,
          //suffixIcon: Icon(Icons.camera_alt),
          suffixIconConstraints: sizeIcon,
          filled: true,
          fillColor: _backgroundColorSeach,
        ),
      ),
    );
  }

  _buildIconButton(
          {VoidCallback onPressed, IconData icon, int notification = 0}) =>
      Stack(
        children: [
          IconButton(
            icon: Icon(icon),
            onPressed: onPressed,
            color: _colorIcon,
            iconSize: 28,
          ),
          notification == 0
              ? SizedBox()
              : Positioned(
                  child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.deepOrange,
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  constraints: BoxConstraints(
                    minHeight: 22,
                    minWidth: 22,
                  ),
                  child: Text(
                    '$notification',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ))
        ],
      );

  void _onSroll() {
    final scrolloffset = widget.scrollController.offset;
    if (scrolloffset >= _offset && scrolloffset > 5) {
      _opacity = double.parse((_opacity + _opacityMax).toStringAsFixed(2));
      if (_opacity >= 1.0) {
        _opacity = 1.0;
      }
    } else if (scrolloffset < 100) {
      _opacity = double.parse((_opacity + _opacityMax).toStringAsFixed(2));
      if (_opacity <= 1.0) {
        _opacity = 0.0;
      }
    }
    setState(() {
      if (scrolloffset <= 0) {
        _backgroundColorSeach = Colors.white;
        _colorIcon = Colors.white;
        _offset = 0.0;
        _opacity = 0.0;
      } else {
        _backgroundColorSeach = Colors.grey[200];
        _colorIcon = Colors.deepOrange;
      }
      _backgroundColor = Colors.white.withOpacity(_opacity);
    });
  }
}
