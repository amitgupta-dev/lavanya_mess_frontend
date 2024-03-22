import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lavanya_mess/providers/auth_provider.dart';
import 'package:lavanya_mess/providers/cart_provider.dart';
import 'package:lavanya_mess/providers/filter_provider.dart';
import 'package:lavanya_mess/providers/list_data_provider.dart';
import 'package:lavanya_mess/providers/navigaton_provider.dart';
import 'package:lavanya_mess/screens/my_app.dart';
import 'package:provider/provider.dart';

void main() {
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
        ],
        child: const MyApp(),
      ),
    ),
  );
}
