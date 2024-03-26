import 'package:flutter/material.dart';
import 'package:lavanya_mess/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class BottomNavigator extends StatefulWidget {
  const BottomNavigator({super.key});

  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
      case 1:
        Navigator.pushNamed(context, '/cart');
      case 2:
        Navigator.pushNamed(context, '/orders');
      default:
        Navigator.pushNamed(context, '/profile');
        break;
    }

    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    CartProvider cart = Provider.of<CartProvider>(context);
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      selectedItemColor: const Color(0xFFff4747),
      selectedIconTheme: const IconThemeData(
        size: 30,
      ),
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      items: <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Stack(children: [
            Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              child: Text(cart.getItemsCount().toString()),
            ),
            const Icon(Icons.shopping_cart)
          ]),
          label: 'Cart',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag),
          label: 'Orders',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Me',
        ),
      ],
    );
  }
}
