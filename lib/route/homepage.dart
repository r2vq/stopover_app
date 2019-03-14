import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:stopover_app/route/category_list_page.dart';
import 'package:stopover_app/route/favourites_page.dart';
import 'package:stopover_app/route/flight_page.dart';
import 'package:stopover_app/widget/default_app_bar.dart';

class Homepage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 1;
  final List<Widget> _children = [
    FavouritesPage(),
    CategoryListPage(),
    FlightPage(),
  ];

  final List<TabData> _tabs = [
    TabData(iconData: Icons.star, title: "My List"),
    TabData(iconData: Icons.attach_money, title: "Deals"),
    TabData(iconData: Icons.flight_takeoff, title: "My Flight"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(),
      body: Center(
        child: _children[_selectedIndex],
      ),
      bottomNavigationBar: FancyBottomNavigation(
        tabs: _tabs,
        onTabChangedListener: _onItemTapped,
        initialSelection: 1,
        activeIconColor: Colors.white,
        inactiveIconColor: Colors.red,
        textColor: Colors.red,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
