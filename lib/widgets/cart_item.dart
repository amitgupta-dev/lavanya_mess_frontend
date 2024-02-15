import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({super.key});

  @override
  Widget build(BuildContext context) {
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
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/banner.jpg'),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.all(
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
                        const Text(
                          'Chicken Curry Nikal Bhai abhi ke abhi jaldi kya',
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              '₹ 500',
                              style: TextStyle(
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
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(
                                      Icons.remove,
                                      size: 18,
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
                                    child: const Text(
                                      '555',
                                      style: TextStyle(fontSize: 16),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 5),
                                    child: Icon(
                                      Icons.add,
                                      size: 18,
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
