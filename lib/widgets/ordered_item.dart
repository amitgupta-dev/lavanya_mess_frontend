import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lavanya_mess/providers/navigaton_provider.dart';
import 'package:lavanya_mess/services/api_services.dart';
import 'package:lavanya_mess/utils/toast.dart';
import 'package:provider/provider.dart';

class OrderedItem extends StatelessWidget {
  final dynamic order;

  final Function? onUpdate;

  const OrderedItem({super.key, required this.order, this.onUpdate});

  @override
  Widget build(BuildContext context) {
    NavigationProvider navigator = Provider.of<NavigationProvider>(context);
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              order['products']
                                  .map((item) =>
                                      '${item['product']['name']} × ${item['quantity'].toString()} ')
                                  .join(','),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  const Text(
                                    'Total : ',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Color(0xcc000000),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const Icon(
                                    Icons.currency_rupee_outlined,
                                    color: Color(0xcc000000),
                                    size: 16,
                                  ),
                                  Text(
                                    order['totalPrice'].toString(),
                                    style: const TextStyle(
                                        fontSize: 16, color: Color(0xcc000000)),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      order['status'].toUpperCase(),
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
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
                        DateFormat('EEEE, MMM d, yyyy')
                            .format(DateTime.parse(order['createdAt'])),
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
                      child: order['status'] == 'pending'
                          ? TextButton(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                  const EdgeInsets.symmetric(horizontal: 10),
                                ),
                              ),
                              onPressed: () async {
                                debugPrint('hello');
                                dynamic response = await ApiService.request(
                                    '/order/${order['_id']}',
                                    method: 'PATCH',
                                    body: {'status': 'cancelled'});
                                if (response['statusCode'] == 200) {
                                  onUpdate!();
                                  if (context.mounted) {
                                    toast(
                                      context,
                                      'Success',
                                      response['data']['message'],
                                      const Color.fromARGB(255, 3, 189, 74),
                                      icon: Icons.check_rounded,
                                    );
                                  }
                                } else {
                                  if (context.mounted) {
                                    toast(
                                      context,
                                      'Error',
                                      response['data']['message'],
                                      const Color.fromARGB(255, 3, 189, 74),
                                      icon: Icons.error_outline_outlined,
                                    );
                                  }
                                }
                              },
                              child: const Text(
                                'Cancel Order',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : order['status'] == 'delivered'
                              ? TextButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 10),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    'Rate',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : TextButton(
                                  style: ButtonStyle(
                                    padding: MaterialStateProperty.all(
                                      const EdgeInsets.symmetric(
                                          horizontal: 10),
                                    ),
                                  ),
                                  onPressed: () {
                                    navigator.onIndexChanged(0);
                                  },
                                  child: const Text(
                                    'Reorder',
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
