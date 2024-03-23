import 'package:flutter/material.dart';
import 'package:lavanya_mess/screens/main_screens/cart.dart';
import 'package:lavanya_mess/screens/main_screens/home.dart';
import 'package:lavanya_mess/screens/main_screens/orders.dart';
import 'package:lavanya_mess/screens/main_screens/profile.dart';

class NavigationProvider extends ChangeNotifier {
  int _bottomNavIndex = 0;
  Widget _screenWidget = const Home();
  String _pageName = 'Home';

  int get bottomNavIndex => _bottomNavIndex;
  Widget get screenWidget => _screenWidget;
  String get pageName => _pageName;

  void onIndexChanged(int index) {
    switch (index) {
      case 0:
        _screenWidget = const Home();
        _pageName = 'Home';
        break;
      case 1:
        _screenWidget = const Cart();
        _pageName = 'My Cart';
        break;
      case 2:
        _screenWidget = const Orders();
        _pageName = 'My Orders';
        break;
      default:
        _screenWidget = const Profile();
        _pageName = 'Profile';
        break;
    }

    _bottomNavIndex = index;
    notifyListeners();
  }
}
