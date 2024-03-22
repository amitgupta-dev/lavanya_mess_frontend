import 'package:flutter/material.dart';
import 'package:lavanya_mess/providers/navigaton_provider.dart';
import 'package:provider/provider.dart';
import 'package:upi_india/upi_india.dart';

class UpiBottomSheet extends StatefulWidget {
  final Function savePayment;
  final dynamic paymentDetails;
  const UpiBottomSheet(
      {super.key, required this.savePayment, required this.paymentDetails});

  @override
  State createState() => _UpiBottomSheetState();
}

class _UpiBottomSheetState extends State<UpiBottomSheet> {
  final UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  TextStyle header = const TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );

  TextStyle value = const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
      });
    }).catchError((e) {
      apps = [];
    });
    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app, double amount) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: '6299195958@icici',
      receiverName: 'Lavanya Mess & Store',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: 'Thanks for Shopping',
      amount: amount,
    );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  @override
  Widget build(BuildContext context) {
    NavigationProvider navigate = Provider.of<NavigationProvider>(context);
    if (apps == null) {
      return const SizedBox(
          width: double.infinity,
          child: Center(child: CircularProgressIndicator()));
    } else if (apps!.isEmpty) {
      return SizedBox(
        width: double.infinity,
        child: Center(
          child: Text(
            'No apps found to handle transaction.',
            style: header,
          ),
        ),
      );
    } else {
      return SizedBox(
        width: double.infinity,
        child: Wrap(
          children: apps!.map<Widget>((UpiApp app) {
            return GestureDetector(
              onTap: () {
                initiateTransaction(app, widget.paymentDetails['amount'])
                    .then((UpiResponse response) {
                  widget.savePayment(response);
                  Navigator.popUntil(context, (route) => route.isFirst);
                  navigate.onIndexChanged(0);
                }).catchError((error) {
                  debugPrint(error.toString());
                  _upiErrorHandler(error);
                });
              },
              child: SizedBox(
                height: 100,
                width: 100,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.memory(
                      app.icon,
                      height: 60,
                      width: 60,
                    ),
                    Text(app.name),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      );
    }
  }
}
