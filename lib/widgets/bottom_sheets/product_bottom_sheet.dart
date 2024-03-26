import 'package:flutter/material.dart';
import 'package:lavanya_mess/models/product_model.dart';
import 'package:lavanya_mess/providers/cart_provider.dart';
import 'package:lavanya_mess/providers/navigaton_provider.dart';
import 'package:provider/provider.dart';

class ProductBottomSheet extends StatefulWidget {
  final ProductModel data;
  const ProductBottomSheet({super.key, required this.data});

  @override
  State<ProductBottomSheet> createState() => _ProductBottomSheetState();
}

class _ProductBottomSheetState extends State<ProductBottomSheet> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    CartProvider cart = Provider.of<CartProvider>(context);
    NavigationProvider bottomNav = Provider.of<NavigationProvider>(context);
    return Wrap(
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  clipBehavior: Clip.antiAlias,
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 233, 233),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: const Color(0xffffffff),
                    ),
                    child: Column(
                      children: [
                        AspectRatio(
                          aspectRatio: 3 / 2,
                          child: Container(
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15)),
                            child: Image.network(
                              widget.data.thumbnail,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Text(
                                      widget.data.name,
                                      style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Row(children: [
                                      SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Icon(
                                          Icons.favorite_border_outlined,
                                          color: Colors.black54,
                                          size: 24,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 35,
                                        height: 35,
                                        child: Icon(
                                          Icons.reply_outlined,
                                          color: Colors.black54,
                                          size: 24,
                                        ),
                                      ),
                                    ]),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              height: 20,
                              width: 80,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.amber.shade100),
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.amber[50],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.star_outlined,
                                    size: 14,
                                    color: Colors.amber.shade500,
                                  ),
                                  Icon(
                                    Icons.star_outlined,
                                    size: 14,
                                    color: Colors.amber.shade500,
                                  ),
                                  Icon(
                                    Icons.star_outlined,
                                    size: 14,
                                    color: Colors.amber.shade500,
                                  ),
                                  const Icon(
                                    Icons.star_border_outlined,
                                    size: 14,
                                    color: Colors.black26,
                                  ),
                                  const Icon(
                                    Icons.star_border_outlined,
                                    size: 14,
                                    color: Colors.black26,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            widget.data.description,
                            style: const TextStyle(
                                color: Color.fromARGB(166, 0, 0, 0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: cart.inCart(widget.data.id)
              ? Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xffff4747),
                  ),
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero),
                    ),
                    onPressed: () {
                      Navigator.of(context).popUntil((route) => route.isFirst);
                      Future.delayed(const Duration(microseconds: 1000), () {
                        bottomNav.onIndexChanged(1);
                      });
                    },
                    child: const Text(
                      'Go to Cart',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              : Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 40,
                      decoration: BoxDecoration(
                          border: Border.all(color: const Color(0xffff4747)),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                quantity = quantity == 1 ? 1 : --quantity;
                              });
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Icon(
                                Icons.remove,
                                size: 18,
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            decoration: const BoxDecoration(
                              border: Border.symmetric(
                                vertical: BorderSide(color: Colors.transparent),
                              ),
                            ),
                            child: Text(
                              quantity.toString(),
                              style: const TextStyle(fontSize: 18),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() => quantity = ++quantity);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 10),
                              child: Icon(
                                Icons.add,
                                size: 18,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: const Color(0xffff4747),
                        ),
                        child: TextButton(
                          style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.zero),
                          ),
                          onPressed: () {
                            cart.addProduct(widget.data, quantity: quantity);
                          },
                          child: Text(
                            'Add Item ₹${quantity * widget.data.price}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
        )
      ],
    );
  }
}
