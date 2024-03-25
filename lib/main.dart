import 'package:flutter/material.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/providers/cart_provider.dart';
import 'package:lavanya_mess/providers/navigaton_provider.dart';
import 'package:lavanya_mess/providers/util_states_provider.dart';
import 'package:lavanya_mess/screens/my_app.dart';
import 'package:provider/provider.dart';

void main() {
<<<<<<< HEAD
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (value) => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => CartProvider()),
          ChangeNotifierProvider(create: (context) => NavigationProvider()),
          ChangeNotifierProvider(create: (context) => FilterProvider()),
          ChangeNotifierProvider(create: (context) => ListDataProvider()),
          ChangeNotifierProvider(create: (context) => UtilStateProvider()),
        ],
        child: const MyApp(),
      ),
=======
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],
      child: const MyApp(),
>>>>>>> parent of 7425639 (multiple updates)
    ),
  );
}
