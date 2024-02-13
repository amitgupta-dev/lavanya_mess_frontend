import 'package:flutter/material.dart';
import 'package:lavanya_mess/widgets/product_bottom_sheet.dart';

class Product extends StatelessWidget {
  const Product({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (context) => const ProductBottomSheet(),
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
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/banner.jpg'),
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
                      // mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                              flex: 1,
                              child: Text(
                                'Chicken Curry Nikalo Bhai Abhi ke abhi',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                color: Colors.black87,
                              ),
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 0,
                                  horizontal: 5,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      '4.3 ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star_outlined,
                                      color: Colors.white,
                                      size: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const Expanded(
                                flex: 1,
                                child: Text(
                                  'Chicken curry is a popular dish enjoyed in various cuisines around the world, including Indian, Thai, Jamaican, and others. While the specific ingredients and cooking methods can vary greatly depending on regional preferences and traditions, chicken curry typically consists of chicken pieces cooked in a flavorful sauce or gravy made with a variety of spices, herbs, vegetables, and sometimes coconut milk or yogurt.',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.black45),
                                ),
                              ),
                              Container(
                                height: 28,
                                decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Color(0xFFff4747),
                                ),
                                child: TextButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all<
                                        EdgeInsetsGeometry>(EdgeInsets.zero),
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
