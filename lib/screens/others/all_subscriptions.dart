import 'package:flutter/material.dart';

class AllSubscriptions extends StatelessWidget {
  const AllSubscriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'My Subscriptions',

          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white), // White title
        ),
        backgroundColor: Colors.red, // Red theme for app bar
      ),
      body: Container(),
    );
    // SafeArea(
    //   child: SingleChildScrollView(
    //     child: Padding(
    //       padding: const EdgeInsets.all(15),
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         children: [
    //           Align(
    //             alignment: Alignment.topLeft,
    //             child: DropdownButton(
    //               padding: const EdgeInsets.symmetric(horizontal: 15),
    //               borderRadius: BorderRadius.circular(10),
    //               value: dropdownValue,
    //               onChanged: (String? newValue) {
    //                 setState(() {
    //                   dropdownValue = newValue!;
    //                   fetchOrders(filter: dropdownValue);
    //                 });
    //               },
    //               items: [
    //                 'All',
    //                 'Pending',
    //                 'Delivered',
    //                 'Cancelled',
    //                 'Payment Failed'
    //               ].map<DropdownMenuItem<String>>((String value) {
    //                 return DropdownMenuItem<String>(
    //                   value: value,
    //                   child: Text(value),
    //                 );
    //               }).toList(),
    //             ),
    //           ),
    //           if (orders.isEmpty)
    //             SizedBox(
    //               height: MediaQuery.of(context).size.height - 250,
    //               child: const Center(
    //                 child: Text("You haven't ordered anything yet"),
    //               ),
    //             ),
    //           if (orders.isNotEmpty)
    //             ListView.builder(
    //               physics: const NeverScrollableScrollPhysics(),
    //               shrinkWrap: true,
    //               itemCount: orders.length,
    //               itemBuilder: (context, index) {
    //                 return OrderedItem(
    //                     order: orders[index], onUpdate: () => {fetchOrders()});
    //               },
    //             ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
  }
}
