import 'package:flutter/material.dart';
import 'package:lavanya_mess/models/product_model.dart';
import 'package:lavanya_mess/providers/cart_provider.dart';
import 'package:lavanya_mess/widgets/product_bottom_sheet.dart';
import 'package:provider/provider.dart';

class Product extends StatelessWidget {
  final ProductModel productData;
  const Product({super.key, required this.productData});

  @override
  Widget build(BuildContext context) {
    CartProvider cart = Provider.of<CartProvider>(context);
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<dynamic>(
          isScrollControlled: true,
          context: context,
          builder: (context) => ProductBottomSheet(data: productData),
        );
      },
      child: Material(
        elevation: 10,
        borderRadius: const BorderRadius.all(
          Radius.circular(15),
        ),
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12),
            borderRadius: const BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(productData.thumbnail),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: SizedBox(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                productData.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            productData.rating.avg != null
                                ? Container(
                                    decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: Colors.black87,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0,
                                        horizontal: 5,
                                      ),
                                      child: Row(
                                        children: [
                                          Text(
                                            productData.rating.avg.toString(),
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                            ),
                                          ),
                                          const Icon(
                                            Icons.star_outlined,
                                            color: Colors.white,
                                            size: 12,
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                : Container(),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  productData.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 13, color: Colors.black45),
                                ),
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              cart.inCart(productData.id)
                                  ? Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Color(0xFFff4747),
                                      ),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                                  EdgeInsetsGeometry>(
                                              EdgeInsets.zero),
                                        ),
                                        onPressed: () {},
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Color(0xffffffff),
                                              size: 18,
                                            ),
                                            Text(
                                              ' Go to Cart',
                                              style: TextStyle(
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 6),
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5)),
                                        color: Color(0xFFff4747),
                                      ),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all<
                                                  EdgeInsetsGeometry>(
                                              EdgeInsets.zero),
                                        ),
                                        onPressed: () {
                                          cart.addProduct(productData);
                                        },
                                        child: const Row(
                                          children: [
                                            Icon(
                                              Icons.shopping_bag_outlined,
                                              color: Color(0xffffffff),
                                              size: 18,
                                            ),
                                            Text(
                                              ' Add',
                                              style: TextStyle(
                                                color: Color(0xffffffff),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                            ],
                          ),
                        ),
                      ],
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
