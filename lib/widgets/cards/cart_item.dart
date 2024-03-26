import 'package:flutter/material.dart';
import 'package:lavanya_mess/models/cart_item.dart';
import 'package:lavanya_mess/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartItem extends StatelessWidget {
  final CartItemModel data;
  const CartItem({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    CartProvider cart = Provider.of<CartProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          width: double.infinity,
          height: 110,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                AspectRatio(
                  aspectRatio: 1.4,
                  child: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(data.product.thumbnail),
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    child: Container(),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 10, right: 10, bottom: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data.product.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '₹ ${data.product.price * data.quantity}',
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              clipBehavior: Clip.antiAlias,
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: const Color(0xffff4747),
                                  ),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      cart.decreaseQuantity(data.product.id);
                                    },
                                    borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(10),
                                        topLeft: Radius.circular(10)),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Icon(
                                        Icons.remove,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: 35,
                                    decoration: const BoxDecoration(
                                      border: Border.symmetric(
                                        vertical: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                    ),
                                    child: Text(
                                      data.quantity.toString(),
                                      style: const TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      cart.increaseQuantity(data.product.id);
                                    },
                                    borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 5),
                                      child: Icon(
                                        Icons.add,
                                        size: 18,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
