import 'package:flutter/material.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/widgets/location_bottom_sheet.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    AuthProvider auth = Provider.of<AuthProvider>(context);

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(auth.authData?['avatar']),
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
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: Material(
              //     clipBehavior: Clip.antiAlias,
              //     borderRadius: BorderRadius.circular(10),
              //     elevation: 5,
              //     child: MouseRegion(
              //       cursor: SystemMouseCursors.text,
              //       child: GestureDetector(
              //         onTap: () {
              showModalBottomSheet<dynamic>(
                isScrollControlled: true,
                context: context,
                // useSafeArea: true,
                builder: (context) => const LocationBottomSheet(),
              );
              //         },
              //         child: Container(
              //           padding: const EdgeInsets.symmetric(
              //               horizontal: 15, vertical: 8),
              //           decoration: BoxDecoration(
              //             border: Border.all(color: Colors.black38),
              //             borderRadius: BorderRadius.circular(10),
              //           ),
              //           child: const Row(
              //             mainAxisAlignment:
              //                 MainAxisAlignment.spaceBetween,
              //             children: [
              //               Text(
              //                 'Search',
              //                 style: TextStyle(
              //                     color: Color.fromRGBO(0, 0, 0, 0.5),
              //                     fontSize: 18,
              //                     fontWeight: FontWeight.w500),
              //               ),
              //               Icon(
              //                 color: Color(0xFFff4747),
              //                 Icons.search_outlined,
              //                 size: 30,
              //               ),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
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
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
