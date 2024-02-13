import 'package:flutter/material.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => Container(
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                    child: Center(
                      child: Text("Modal content goes here"),
                    ),
                  ),
                );
              },
              child: Text('Open Bottom Tab'),
            ),
          ),
        ),
      ),
    );
  }
}
