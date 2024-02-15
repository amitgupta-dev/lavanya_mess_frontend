import 'package:flutter/material.dart';
import 'package:lavanya_mess/widgets/ordered_item.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  String dropdownValue = 'All';
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
                    });
                  },
                  items: ['All', 'Pending', 'Delivered']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              const OrderedItem(),
              const OrderedItem(),
              const OrderedItem(),
              const OrderedItem(),
              const OrderedItem(),
            ],
          ),
        ),
      ),
    );
  }
}
