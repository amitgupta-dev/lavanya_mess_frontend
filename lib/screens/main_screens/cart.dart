import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavanya_mess/widgets/cart_item.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              const CartItem(),
              const CartItem(),
              const CartItem(),
              const CartItem(),
              const CartItem(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cart Summary',
                        style: GoogleFonts.leckerliOne(
                            fontSize: 30, color: const Color(0xFFff4747)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Items Total',
                              style: GoogleFonts.leckerliOne(fontSize: 18)),
                          Text('₹500',
                              style: GoogleFonts.leckerliOne(fontSize: 18)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery',
                              style: GoogleFonts.leckerliOne(fontSize: 18)),
                          Text('₹50',
                              style: GoogleFonts.leckerliOne(fontSize: 18)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount',
                              style: GoogleFonts.leckerliOne(fontSize: 18)),
                          Text('₹100',
                              style: GoogleFonts.leckerliOne(fontSize: 18)),
                        ],
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Total',
                              style: GoogleFonts.leckerliOne(fontSize: 20)),
                          Text('₹450',
                              style: GoogleFonts.leckerliOne(fontSize: 20)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  width: 180,
                  height: 40,
                  child: TextButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffffffff),
                      ),
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFFff4747),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Checkout ➜',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
