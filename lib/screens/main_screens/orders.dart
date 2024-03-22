import 'package:flutter/material.dart';
import 'package:lavanya_mess/services/api_services.dart';
import 'package:lavanya_mess/widgets/ordered_item.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  String dropdownValue = 'All';
  dynamic orders = [];

  void fetchOrders({String? filter}) async {
    String query = '';
    if (filter == 'Pending') {
      query = '?status=pending';
    }
    if (filter == 'Delivered') {
      query = '?status=delivered';
    }
    if (filter == 'Cancelled') {
      query = '?status=Cancelled';
    }
    if (filter == 'Payment Failed') {
      query = '?status=payment failed';
    }
    dynamic response = await ApiService.request('/order/search$query');
    if (response['statusCode'] == 200) {
      List<dynamic> newOrders = response['data']['orders'];
      setState(() {
        orders = newOrders;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: DropdownButton(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  borderRadius: BorderRadius.circular(10),
                  value: dropdownValue,
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue!;
                      fetchOrders(filter: dropdownValue);
                    });
                  },
                  items: [
                    'All',
                    'Pending',
                    'Delivered',
                    'Cancelled',
                    'Payment Failed'
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              if (orders.isEmpty)
                SizedBox(
                  height: MediaQuery.of(context).size.height - 250,
                  child: const Center(
                    child: Text("You haven't ordered anything yet"),
                  ),
                ),
              if (orders.isNotEmpty)
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: orders.length,
                  itemBuilder: (context, index) {
                    return OrderedItem(
                        order: orders[index], onUpdate: () => {fetchOrders()});
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
