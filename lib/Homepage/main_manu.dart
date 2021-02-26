import 'package:flutter/material.dart';
import 'package:hello/Homepage/main_menu_viewmodel.dart';
import 'package:localstorage/localstorage.dart';

class MainMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MainMenu();
  }
}

final List<MainMenuModel> _menus = MainMenuViewModel().getMainMenu();

class _MainMenu extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      padding: EdgeInsets.only(top: 18),
      child: GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 12),
        scrollDirection: Axis.horizontal,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.25,
        ),
        itemBuilder: (context, index) {
          final MainMenuModel menu = _menus[index];
          return Column(
            children: [
              Container(
                width: 55,
                height: 55,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                      side: BorderSide(color: Colors.black)),
                  padding: EdgeInsets.all(8),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => menu.function),
                    );

                    //todo
                  },
                  child: Image.asset(
                    menu.image,
                    //color: menu.color,
                  ),
                ),
              ),
              SizedBox(height: 4),
              Text(
                menu.title,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
        itemCount: _menus.length,
      ),
    );
  }
}
