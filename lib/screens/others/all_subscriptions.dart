import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lavanya_mess/screens/others/sub_stats.dart';
import 'package:lavanya_mess/services/api_services.dart';

class AllSubscriptions extends StatefulWidget {
  const AllSubscriptions({super.key});

  @override
  State<AllSubscriptions> createState() => _AllSubscriptionsState();
}

class _AllSubscriptionsState extends State<AllSubscriptions> {
  List<dynamic> _subscriptions = [];
  String _dropdownValue = 'all';

  void fetchSubscriptions({String? filter}) async {
    String query = '';
    if (filter == 'active') {
      query = '?status=active';
    }
    if (filter == 'expired') {
      query = '?status=expired';
    }
    dynamic response = await ApiService.request('/subscription/search$query');

    debugPrint(response.toString());
    if (response['statusCode'] == 200) {
      List<dynamic> newSubscriptions = response['data']['subscriptions'];
      setState(() {
        _subscriptions = newSubscriptions;
      });
      debugPrint('hello subs:${_subscriptions.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSubscriptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            'My Subscriptions',

            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white), // White title
          ),
          backgroundColor: const Color(0xffff4747), // Red theme for app bar
        ),
        body: SafeArea(
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
                      value: _dropdownValue,
                      onChanged: (String? newValue) {
                        setState(() {
                          _dropdownValue = newValue!;
                          fetchSubscriptions(filter: _dropdownValue);
                        });
                      },
                      items: [
                        'all',
                        'active',
                        'expired',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value.toUpperCase()),
                        );
                      }).toList(),
                    ),
                  ),
                  if (_subscriptions.isEmpty)
                    SizedBox(
                      height: MediaQuery.of(context).size.height - 250,
                      child: const Center(
                        child: Text("You haven't subscribed yet"),
                      ),
                    ),
                  if (_subscriptions.isNotEmpty)
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _subscriptions.length,
                      itemBuilder: (context, index) {
                        return SubscriptionItem(
                            data: _subscriptions[index],
                            onUpdate: () => {fetchSubscriptions()});
                      },
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}

class SubscriptionItem extends StatelessWidget {
  final dynamic data;
  final Function onUpdate;

  const SubscriptionItem(
      {super.key, required this.data, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
            image: NetworkImage(data['plan']['banner']), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: const Color.fromRGBO(225, 225, 225, 0.3),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: const Color(0xffff4747).withOpacity(0.5), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    '${data['plan']['name'].toUpperCase()}: ${data['status'].toUpperCase()}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.currency_rupee_outlined,
                      size: 18,
                    ),
                    Text(
                      data['plan']['price'].round().toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Started: ${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(data['startDate']))}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Ends On: ${DateFormat('dd/MM/yyyy').format(DateTime.fromMillisecondsSinceEpoch(data['endDate']))}',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SubStats(
                            data: data,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black54)),
                      child: const Padding(
                        padding: EdgeInsets.only(top: 2, bottom: 2, left: 10),
                        child: Row(
                          children: [
                            Text(
                              'See Stats',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Icon(
                              Icons.navigate_next_outlined,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
