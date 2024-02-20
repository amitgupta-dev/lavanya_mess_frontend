import 'package:flutter/material.dart';
import 'package:lavanya_mess/screens/main_screens/cart.dart';
import 'package:lavanya_mess/screens/main_screens/home.dart';
import 'package:lavanya_mess/screens/main_screens/orders.dart';
import 'package:lavanya_mess/screens/main_screens/profile.dart';
import 'package:lavanya_mess/widgets/my_drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 2;
  Widget screenWidget = const Home();
  String pageName = 'Home';

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        setState(() {
          screenWidget = const Home();
          pageName = 'Home';
        });
      case 1:
        setState(() {
          screenWidget = const Cart();
          pageName = 'My Cart';
        });
      case 2:
        setState(() {
          screenWidget = const Orders();
          pageName = 'My Orders';
        });
      default:
        setState(() {
          screenWidget = const Profile();
          pageName = 'Profile';
        });
        break;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFff4747),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 32,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              color: Colors.white,
            );
          },
        ),
        title: Row(
          children: [
            Text(
              pageName,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFFff4747),
        selectedIconTheme: const IconThemeData(
          size: 30,
        ),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Me',
          ),
        ],
      ),
      body: screenWidget,
    );
  }
}
