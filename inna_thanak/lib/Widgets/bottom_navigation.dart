import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:inna_thanak/Screens/Authentication/signin_screen.dart';
import 'package:inna_thanak/Screens/all_bordings.dart';
import 'package:inna_thanak/Screens/favorites_screen.dart';
import 'package:inna_thanak/Screens/postad_screen.dart';
import 'package:inna_thanak/Screens/profile_screen.dart';
import 'package:inna_thanak/Utils/network.dart';

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home", Colors.blue,
        labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    new TabItem(Icons.add_circle_outline, "Post ad", Colors.orange,
        labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    new TabItem(Icons.favorite_border, "Favorite", Colors.red,
        labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
    new TabItem(Icons.person_pin, "Profile", Colors.cyan,
        labelStyle:
            TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
  ]);

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(
            child: bodyContainer(),
            padding: EdgeInsets.only(bottom: bottomNavBarHeight),
          ),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  Widget bodyContainer() {
    Widget slogan;
    switch (selectedPos) {
      case 0:
        slogan = AllBordings();
        break;
      case 1:
        slogan = PostAdScreen();
        break;
      case 2:
        slogan = NetworkDataPaser.accesstoken == null?LoginPage():FavoriteScreen();
        break;
      case 3:
        slogan = NetworkDataPaser.accesstoken == null?LoginPage():ProfileScreen();
        break;
    }

    return slogan;
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Color(0xFF192A56),
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
