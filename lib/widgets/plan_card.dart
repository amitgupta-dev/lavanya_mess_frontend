import 'package:flutter/material.dart';

class PlanCard extends StatelessWidget {
  final String name;
  final String price;
  final Color? color;
  final Widget icon;

  const PlanCard(
      {super.key,
      required this.name,
      required this.price,
      this.color = const Color(0xffffffff),
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      child: Material(
        elevation: 10,
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: const EdgeInsets.all(5),
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon,
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff),
                  ),
                ),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xffffffff),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
