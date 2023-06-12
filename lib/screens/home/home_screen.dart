import 'package:flutter/material.dart';
import 'package:zesdromachinetes/screens/profile/profile.dart';

import 'main_homescreen.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    MainHomeScreen(),
    Text('Search Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Favotire Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Profile()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF012A52),
        unselectedLabelStyle: const TextStyle(
          color: Color(0xFF9A9A9A),
          fontSize: 12,
        ),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('asset/icons/home.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('asset/icons/search.png'),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('asset/icons/favaritores.png'),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('asset/icons/profile.png'),
            label: 'Profile',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: const Color(0xFF9A9A9A),
        unselectedItemColor: const Color(0xFF9A9A9A),
        iconSize: 40,
        onTap: _onItemTapped,
        elevation: 5,
      ),
    );
  }
}
