import 'package:flutter/material.dart';

class CustomInputWidget extends StatelessWidget {
  final String text;
  const CustomInputWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(fontSize: 15),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
