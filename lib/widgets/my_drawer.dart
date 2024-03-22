import 'package:flutter/material.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/widgets/location_bottom_sheet.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    dynamic auth = Provider.of<AuthProvider>(context);
    debugPrint('hello${auth.authData.toString()}');

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(auth.authData['avatar']),
            ),
            accountEmail: Text(
              auth.authData?['email'],
              style: const TextStyle(fontSize: 14),
            ),
            accountName: Text(
              auth.authData?['name'],
              style: const TextStyle(fontSize: 18),
            ),
            decoration: const BoxDecoration(
              color: Color(0xffff4747),
            ),
          ),
          ListTile(
            onTap: () {
              showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(10.0)),
                ),
                useSafeArea: true,
                builder: (context) => const LocationBottomSheet(),
              );
            },
            leading: const Icon(
              Icons.add_location_alt_outlined,
              color: Color(0xddff4747),
            ),
            title: const Text(
              'Location',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.restaurant_menu_outlined,
              color: Color(0xddff4747),
            ),
            title: const Text(
              'Mess Plans',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              Future.delayed(const Duration(microseconds: 1000), () {
                Navigator.pushNamed(context, '/plans');
              });
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.card_membership_outlined,
              color: Color(0xddff4747),
            ),
            title: const Text(
              'Subscriptions',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pop(context);
              Future.delayed(const Duration(microseconds: 1000), () {
                Navigator.pushNamed(context, '/allsubscriptions');
              });
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.payments_outlined,
              color: Color(0xddff4747),
            ),
            title: const Text(
              'Payments',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.support_agent_outlined,
              color: Color(0xddff4747),
            ),
            title: const Text(
              'Help & Support',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/helpandsupport');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.info_outlined,
              color: Color(0xddff4747),
            ),
            title: const Text(
              'About Us',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              Navigator.pushNamed(context, '/aboutus');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.thumb_up_outlined,
              color: Color(0xddff4747),
            ),
            title: const Text(
              'Rate Us',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () async {
              const String appPackage = 'com.example.lavanya_mess';
              final Uri url = Uri.parse(
                  'https://play.google.com/store/apps/details?id=$appPackage');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              } else {
                throw 'Could not launch $url';
              }
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.logout_outlined,
              color: Color(0xddff4747),
            ),
            title: const Text(
              'Logout',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () {
              auth.logout(context);
            },
          ),
        ],
      ),
    );
  }
}
