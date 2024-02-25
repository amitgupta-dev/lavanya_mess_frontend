import 'package:flutter/material.dart';

class ProductBottomSheet extends StatelessWidget {
  const ProductBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Expanded(
          flex: 1,
          child: Container(
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
                              child: Image.asset(
                                'assets/images/banner.jpg',
                              ),
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 5),
                            child: const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        'Chicken Curry',
                                        style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    Padding(
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
                          const Padding(
                            padding: EdgeInsets.all(5),
                            child: Text(
                              'Chicken curry is a popular dish enjoyed in various cuisines around the world, including Indian, Thai, Jamaican, and others. While the specific ingredients and cooking methods can vary greatly depending on regional preferences and traditions, chicken curry typically consists of chicken pieces cooked in a flavorful sauce or gravy made with a variety of spices, herbs, vegetables, and sometimes coconut milk or yogurt.',
                              style: TextStyle(
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
        ),
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Row(
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                height: 40,
                decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xffff4747)),
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.remove,
                        size: 18,
                      ),
                    ),
                    Container(
                      width: 50,
                      decoration: const BoxDecoration(
                        border: Border.symmetric(
                          vertical: BorderSide(color: Colors.transparent),
                        ),
                      ),
                      child: const Text(
                        '555',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.add,
                        size: 18,
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
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                          EdgeInsets.zero),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Add Item ₹1000',
                      style: TextStyle(color: Colors.white, fontSize: 16),
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
