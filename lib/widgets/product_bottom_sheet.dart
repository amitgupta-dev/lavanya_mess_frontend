import 'package:flutter/material.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          AspectRatio(
            aspectRatio: 3 / 2,
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/images/banner.jpg',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
