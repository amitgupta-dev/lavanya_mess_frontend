import 'package:flutter/material.dart';
import 'package:lavanya_mess/screens/auth_screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            child: Text('Dashboard'),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
              // Update UI based on item 1 selection
            },
          ),
          ListTile(
            title: const Text('Clear State'),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              prefs.setBool('boarding', false);
              if (!context.mounted) return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const SplashScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
