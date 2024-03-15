import 'package:flutter/material.dart';

class CustomInputWidget extends StatefulWidget {
  final String labelText;
  final String? value;
  final TextInputType inputType;
  final bool? readOnly; // Make inputType optional
  final Function(String)? onChanged;

  const CustomInputWidget(
      {Key? key,
      required this.labelText,
      this.value,
      this.inputType =
          TextInputType.text, // Default to TextInputType.text if not provided
      this.onChanged,
      this.readOnly})
      : super(key: key);

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

class _CustomInputWidgetState extends State<CustomInputWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextFormField(
        controller: _controller,
        onChanged: widget.onChanged,
        readOnly: widget.readOnly ?? false,
        keyboardType:
            widget.inputType, // Set keyboard type based on provided inputType
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(fontSize: 15),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
