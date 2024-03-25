import 'package:flutter/material.dart';
import 'package:lavanya_mess/models/mess_plan.dart';
<<<<<<< HEAD
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/providers/util_states_provider.dart';
=======
>>>>>>> parent of 7425639 (multiple updates)
import 'package:lavanya_mess/screens/others/menu.dart';
import 'package:lavanya_mess/services/api_services.dart';

class Plans extends StatefulWidget {
  const Plans({super.key});

  @override
  State<Plans> createState() => _PlansState();
}

class _PlansState extends State<Plans> {
  List<MessPlanModel> plans = [];
  @override
  void initState() {
    super.initState();
    ApiService.request('/plan/search').then((response) {
      if (response['statusCode'] == 200) {
        List<dynamic> planList = response['data']['plans'];
        setState(() {
          plans = planList.map((data) => MessPlanModel.fromJson(data)).toList();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    final AuthProvider auth = Provider.of<AuthProvider>(context);
    final UtilStateProvider utilStates =
        Provider.of<UtilStateProvider>(context);

    void createSubscription({UpiResponse? txnRes}) async {
      utilStates.setIsLoading(true);
      Map<String, dynamic> paymentBody = {
        'amount': plans.firstWhere((plan) => plan.id == selectedPlanId).price,
        'method': 'upi',
        'status': txnRes?.status == 'success' ? 'completed' : 'failed',
        'txnId': txnRes?.transactionId ?? '',
        'txnRef': txnRes?.transactionRefId ?? '',
        'approvalRef': txnRes?.approvalRefNo ?? '',
      };
      dynamic createdPayment = await ApiService.request('/payment',
          method: 'POST', body: paymentBody);

      List<dynamic> locations = auth.authData['locations'];
      if (txnRes?.status == 'success') {
        Map<String, dynamic> subscriptionBody = {
          'plan': selectedPlanId,
          'startDate': DateTime.now(),
          'endDate': DateTime.now().add(const Duration(days: 30)),
          'payment': createdPayment['data']['paymentDetails']['_id'],
          'status': 'active',
          'destination':
              locations.firstWhere((element) => element['isDefault'] == true)
        };
        await ApiService.request('/subscription',
            method: 'POST', body: subscriptionBody);
      }
      utilStates.setIsLoading(false);
    }

    bool hasDefaultLocation =
        auth.authData['locations'].any((item) => item['isDefault'] == true);

=======
>>>>>>> parent of 7425639 (multiple updates)
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mess Plans',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
<<<<<<< HEAD
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ListView.builder(
                  itemCount: plans.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPlanId = plans[index].id;
                        });
                      },
                      child: Plan(
                        data: plans[index],
                        border: selectedPlanId == plans[index].id
                            ? Border.all(
                                color: const Color.fromARGB(255, 255, 0, 0),
                                width: 1.5)
                            : Border.all(color: Colors.black12),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          selectedPlanId.isNotEmpty
              ? CustomButton(
                  text: hasDefaultLocation
                      ? 'Buy Plan ₹${plans.firstWhere((plan) => plan.id == selectedPlanId).price}'
                      : 'Set Location',
                  height: 60,
                  onPressed: () {
                    if (hasDefaultLocation) {
                      showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        builder: (context) => UpiBottomSheet(
                          savePayment: createSubscription,
                          paymentDetails: {
                            'amount': plans
                                .firstWhere((plan) => plan.id == selectedPlanId)
                                .price
                          },
                        ),
                      );
                    } else {
                      Navigator.pushNamed(context, '/location');
                    }
                  },
                )
              : Container(),
        ],
=======
      body: Center(
        child: Column(
          children: [
            ListView.builder(
              itemCount: plans.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Plan(
                  data: plans[index],
                );
              },
            )
          ],
        ),
>>>>>>> parent of 7425639 (multiple updates)
      ),
    );
  }
}

class Plan extends StatelessWidget {
  final MessPlanModel data;

  const Plan({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.currency_rupee_outlined,
                  ),
                  Text(
                    data.price.toString(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              Text(
                data.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            '${data.timesADay} times a day',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Menu(
                      plan: data,
                    ),
                  ),
                );
              },
              child: const SizedBox(
                width: 100,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Row(
                    children: [
                      Text(
                        'See Menu',
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Icon(
                        Icons.navigate_next_outlined,
                        color: Colors.black54,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
