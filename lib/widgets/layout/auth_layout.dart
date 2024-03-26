import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget heading;
  final List<Widget> children;

  const AuthLayout({super.key, required this.children, required this.heading});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 241, 236, 236),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.6,
                  ),
                  alignment: Alignment.topLeft,
                  child: Image.asset(screenWidth > 470
                      ? 'assets/images/ic_chicken_big.png'
                      : 'assets/images/ic_chicken.png'),
                ),
                Container(
                  constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 0.4,
                  ),
                  alignment: Alignment.bottomRight,
                  child: Image.asset('assets/images/ic_bottom_bg.png'),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: MediaQuery.of(context).size.height >= 600 ? 2 : 3,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Material(
                  elevation: 10,
                  borderRadius: const BorderRadius.all(Radius.circular(24)),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      width: double.infinity,
                      constraints: const BoxConstraints(
                        maxWidth: 400,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 20),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: heading,
                            ),
                            ...children,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
