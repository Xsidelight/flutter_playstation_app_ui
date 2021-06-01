import 'package:flutter/material.dart';
import 'package:flutter_playstation_app/ui/screens/bottom_nav_screens/favorites_screen.dart';
import 'package:flutter_playstation_app/ui/screens/bottom_nav_screens/game_screen.dart';
import 'package:flutter_playstation_app/ui/screens/bottom_nav_screens/home_screen.dart';
import 'package:flutter_playstation_app/ui/screens/bottom_nav_screens/shop_screen.dart';
import 'package:flutter_playstation_app/ui/screens/bottom_nav_screens/wallet_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _bottomNavPages = [
    HomeScreen(),
    GamesScreen(),
    ShopScreen(),
    WalletScreen(),
    FavoritesScreen(),
  ];

  int _selectedIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: _bottomNavPages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _selectPage,
        type: BottomNavigationBarType.fixed,
        selectedIconTheme: IconThemeData(color: Theme.of(context).accentColor),
        unselectedIconTheme: IconThemeData(color: Color(0xff908FA3)),
        iconSize: 30,
        backgroundColor: Theme.of(context).primaryColor,
        items: [
          BottomNavigationBarItem(activeIcon: Icon(Icons.home),icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shop), label: ''),
          BottomNavigationBarItem(
             activeIcon: Icon(Icons.account_balance_wallet), icon: Icon(Icons.account_balance_wallet_outlined), label: ''),
          BottomNavigationBarItem(
              activeIcon: Icon(Icons.favorite), icon: Icon(Icons.favorite_border_rounded), label: ''),
        ],
      ),
    );
  }
}
