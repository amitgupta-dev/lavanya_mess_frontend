import 'package:flutter/material.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/screens/my_app.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: const MyApp(),
    ),
  );
}
