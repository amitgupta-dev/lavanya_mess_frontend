import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class OrderedItem extends StatelessWidget {
  const OrderedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Material(
        borderRadius: BorderRadius.circular(10),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: 10, right: 10, bottom: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Chicken Curry × 2, Mater Paneer × 1, Saahi Pulaao × 3',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Row(
                              children: [
                                Text(
                                  'Total : ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xcc000000),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Icon(
                                  Icons.currency_rupee_outlined,
                                  color: Color(0xcc000000),
                                  size: 16,
                                ),
                                Text(
                                  '300',
                                  style: TextStyle(
                                      fontSize: 16, color: Color(0xcc000000)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Pending',
                      style: TextStyle(
                        fontSize: 13,
                        color: Color(0xffff4747),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        DateFormat('EEEE, MMM d, yyyy').format(DateTime.now()),
                        style: const TextStyle(color: Colors.black54),
                      ),
                    ),
                    Container(
                      height: 35,
                      decoration: const BoxDecoration(
                        color: Color(0xffff4747),
                        borderRadius: BorderRadius.all(
                          Radius.circular(5),
                        ),
                      ),
                      child: TextButton(
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(horizontal: 10),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Cancel Order',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
