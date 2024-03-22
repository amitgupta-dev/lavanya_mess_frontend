import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatelessWidget {
  final String whatsappNumber = '6299195958';

  const AboutUs({super.key});

  void _launchWhatsApp() async {
    Uri url = Uri.parse('https://wa.me/$whatsappNumber');
    await launchUrl(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Us',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white, // White title color
          ),
        ),
        backgroundColor: Colors.red, // Red theme for app bar
        iconTheme:
            const IconThemeData(color: Colors.white), // White back button
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Welcome to Lavanya Mess, your go-to destination for delicious and nutritious meals in Ranchi! We specialize in providing mess services for college students and professionals alike, offering a convenient platform to order a variety of dishes on demand.',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0x99000000)), // Black body text with opacity
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Our Mission',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4747)), // Red theme for section title
            ),
            const SizedBox(height: 10.0),
            const Text(
              'At Lavanya Mess, our mission is to make dining easy and enjoyable for college students and professionals living in Ranchi. We understand the importance of wholesome meals for our customers, and we are dedicated to providing high-quality, hygienic, and delicious food options that cater to their tastes and preferences.',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0x99000000)), // Black body text with opacity
            ),
            const SizedBox(height: 20.0),
            const Text(
              'What We Offer',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4747)), // Red theme for section title
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Mess Services:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4747)), // Red section title
            ),
            const Text(
              'We provide mess services for college students and professionals residing in Ranchi. Our mess services offer a hassle-free dining experience, allowing our customers to focus on their studies and work without worrying about meal preparation. With our mess services, customers can enjoy nutritious and balanced meals prepared by experienced chefs.',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0x99000000)), // Black body text with opacity
            ),
            const SizedBox(height: 10.0),
            const Text(
              'On-Demand Ordering:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4747)), // Red section title
            ),
            const Text(
              'In addition to our mess services, we also offer on-demand ordering for a variety of dishes. Whether you\'re a busy student with a hectic schedule or a working professional with limited time, we\'ve got you covered. Our menu features a diverse selection of dishes, including Indian, Chinese, Continental, and more, to suit every palate.',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0x99000000)), // Black body text with opacity
            ),
            const SizedBox(height: 10.0),
            const Text(
              'Three Time Routines:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4747)), // Red section title
            ),
            const Text(
              'We understand that our customers have unique schedules and preferences when it comes to meal times. That\'s why we offer flexible ordering options based on three time routines: breakfast, lunch, and dinner. Whether you need a single meal or want to schedule meals for all three times, you can customize your order according to your preferences.',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0x99000000)), // Black body text with opacity
            ),
            const SizedBox(height: 20.0),
            const Text(
              'How It Works',
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4747)), // Red section title
            ),
            const SizedBox(height: 10.0),
            const Text(
              '1. Browse Menu:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4747)), // Red subheading
            ),
            const Text(
              'Explore our menu to discover a wide range of dishes available for on-demand ordering.',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0x99000000)), // Black body text with opacity
            ),
            const SizedBox(height: 10.0),
            const Text(
              '2. Place Order:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4747)), // Red subheading
            ),
            const Text(
              'Select your desired dishes and choose your preferred time routine (breakfast, lunch, or dinner).',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0x99000000)), // Black body text with opacity
            ),
            const SizedBox(height: 10.0),
            const Text(
              '3. Enjoy Delicious Meals:',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFFF4747)), // Red subheading
            ),
            const Text(
              'Sit back, relax, and enjoy delicious meals delivered right to your doorstep at the scheduled time.',
              style: TextStyle(
                  fontSize: 15,
                  color: Color(0x99000000)), // Black body text with opacity
            ),
            const SizedBox(height: 20.0),
            GestureDetector(
              onTap: _launchWhatsApp,
              child: Row(
                children: [
                  const Text(
                    'Contact us on WhatsApp: ',
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 0.6),
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    whatsappNumber,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
