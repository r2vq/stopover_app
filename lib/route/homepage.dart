import 'package:flutter/material.dart';
import 'package:stopover_app/route/category_list_page.dart';
import 'package:stopover_app/route/favourites_page.dart';
import 'package:stopover_app/route/flight_page.dart';

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

  final List<Widget> _titles = [
    Text("My List"),
    Text("Deals"),
    Text("My Flight"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _titles[_selectedIndex],
      ),
      body: Center(
        child: _children[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            title: _titles[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: _titles[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.flight_takeoff),
            title: _titles[2],
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        fixedColor: Colors.red,
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
