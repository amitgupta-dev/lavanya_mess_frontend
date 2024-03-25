import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lavanya_mess/providers/cart_provider.dart';
import 'package:lavanya_mess/widgets/cart_item.dart';
import 'package:lavanya_mess/widgets/custom_button.dart';
import 'package:lavanya_mess/widgets/upi_bottom_sheet.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    final CartProvider cart = Provider.of<CartProvider>(context);

    final screenHeight = MediaQuery.of(context).size.height;
    final screenwidth = MediaQuery.of(context).size.width;
    final double size =
        (screenHeight < screenwidth ? screenHeight : screenwidth) / 2;
    return SafeArea(
      child: cart.cartItems.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: size,
                    height: size,
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: const Image(
                      image: AssetImage(
                        '/assets/images/empty_cart.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Text(
                    'Cart is Empty',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromRGBO(255, 0, 0, 0.5),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    ...cart.cartItems
                        .map((item) => CartItem(data: item))
                        .toList(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
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
                                    style:
                                        GoogleFonts.leckerliOne(fontSize: 18)),
                                Text('₹${cart.getTotalPrice()}',
                                    style:
                                        GoogleFonts.leckerliOne(fontSize: 18)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Delivery',
                                    style:
                                        GoogleFonts.leckerliOne(fontSize: 18)),
                                Text('₹50',
                                    style:
                                        GoogleFonts.leckerliOne(fontSize: 18)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Discount',
                                    style:
                                        GoogleFonts.leckerliOne(fontSize: 18)),
                                Text('₹${cart.getDiscount()}',
                                    style:
                                        GoogleFonts.leckerliOne(fontSize: 18)),
                              ],
                            ),
                            const Divider(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total',
                                    style:
                                        GoogleFonts.leckerliOne(fontSize: 20)),
                                Text(
                                    '₹${cart.getTotalPrice() + 50 - cart.getDiscount()}',
                                    style:
                                        GoogleFonts.leckerliOne(fontSize: 20)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CustomButton(
                        text: hasDefaultLocation ? 'Checkout' : 'Set Location',
                        onPressed: () {
                          showModalBottomSheet(
                              context: context,
                              builder: (context) => const UpiBottomSheet());
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
