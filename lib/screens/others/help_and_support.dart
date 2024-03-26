import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpAndSupport extends StatelessWidget {
  const HelpAndSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Help and Support',

          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white), // White title
        ),
        backgroundColor: Colors.red, // Red theme for app bar
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Us:',
              style: TextStyle(
                  fontSize: 18.0,
                  color: const Color(0xffff4747).withOpacity(0.8),
                  fontWeight: FontWeight.bold), // Red color with opacity
            ),
            const SizedBox(height: 20.0),
            ListTile(
              onTap: () async {
                Uri url = Uri(
                  scheme: 'mailto',
                  path: 'mramitgupta.occult@gmail.com',
                );
                await launchUrl(url);
              },
              leading: const Icon(Icons.email, color: Colors.red), // Email icon
              title: const Text(
                'Email: mramitgupta.occult@gmail.com',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87), // Black color for text
              ),
            ),
            ListTile(
              onTap: () async {
                Uri url = Uri.parse('tel:+916299195958');
                await launchUrl(url);
              },
              leading: const Icon(Icons.phone, color: Colors.red), // Phone icon
              title: const Text(
                'Phone: +916299195958',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87), // Black color for text
              ),
            ),
            ListTile(
              onTap: () async {
                Uri url = Uri.parse('geo:23.3922342,85.1989362');
                await launchUrl(url);
              },
              leading: const Icon(Icons.location_on,
                  color: Colors.red), // Location icon
              title: const Text(
                'Address: Simaliya, Ring Road, Ranchi, Jharkhand, IN',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black87), // Black color for text
              ),
            ),
          ],
        ),
      ),
    );
  }
}
