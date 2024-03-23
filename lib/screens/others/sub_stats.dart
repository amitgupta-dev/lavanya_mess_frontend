import 'package:flutter/material.dart';

class SubStats extends StatefulWidget {
  final dynamic data;

  const SubStats({super.key, required this.data});

  @override
  State<SubStats> createState() => _SubStatsState();
}

class _SubStatsState extends State<SubStats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Subscription Statistics',

          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.white), // White title
        ),
        backgroundColor: const Color(0xffff4747), // Red theme for app bar
      ),
      body: const Center(
        child: Text("Siyc 😁, This page hasn't been created yet"),
      ),
    );
  }
}
