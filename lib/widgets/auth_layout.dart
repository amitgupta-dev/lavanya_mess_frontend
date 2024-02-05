import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  final Widget child;
  const AuthLayout({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 241, 236, 236),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  constraints: const BoxConstraints(maxWidth: 460),
                  child: Image.asset('assets/images/ic_chicken.png'),
                ),
                Container(
                  constraints: const BoxConstraints(maxWidth: 400),
                  child: Image.asset('assets/images/ic_bottom_bg.png'),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.transparent,
                ),
              ),
              child,
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
