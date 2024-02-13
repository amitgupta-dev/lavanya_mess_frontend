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
                              fontSize: 18, fontWeight: FontWeight.w600),
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
                                  border: Border.all(color: Colors.black45),
                                  borderRadius: BorderRadius.circular(5)),
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
                                    width: 40,
                                    decoration: const BoxDecoration(
                                        border: Border.symmetric(
                                            vertical: BorderSide(
                                                color: Colors.black45))),
                                    child: TextFormField(
                                      style: const TextStyle(fontSize: 14.0),
                                      textAlignVertical:
                                          TextAlignVertical.center,
                                      textAlign: TextAlign.center,
                                      keyboardType: TextInputType.number,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                      ),
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
                            )
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
