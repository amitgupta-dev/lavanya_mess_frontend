import 'package:flutter/material.dart';
import 'package:lavanya_mess/providers/cart_provider.dart';
import 'package:lavanya_mess/providers/navigaton_provider.dart';
import 'package:lavanya_mess/widgets/navComponents/my_drawer.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    CartProvider cart = Provider.of<CartProvider>(context);
    NavigationProvider bottomNav = Provider.of<NavigationProvider>(context);

    int cartCount = cart.getItemsCount();
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
              bottomNav.pageName,
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
        currentIndex: bottomNav.bottomNavIndex,
        onTap: (index) => bottomNav.onIndexChanged(index),
        items: <BottomNavigationBarItem>[
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Stack(children: [
              const Center(child: Icon(Icons.shopping_cart)),
              if (cartCount > 0)
                Transform.translate(
                  offset: const Offset(10, -5),
                  child: Container(
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.red),
                    child: Center(
                        child: Text(
                      cartCount.toString(),
                      style: const TextStyle(fontSize: 10, color: Colors.white),
                    )),
                  ),
                ),
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
      ),
      body: bottomNav.screenWidget,
    );
  }
}
