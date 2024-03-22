import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final double? height;
  final double? width;
  final double? radius;
  final VoidCallback onPressed;
  const CustomButton(
      {Key? key,
      required this.text,
      this.height,
      this.radius,
      this.width,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 40,
      width: width ?? double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xffff4747),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 5)),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
