import 'package:app_warehouse/pages/log_in/log_in_screen.dart';
import 'package:app_warehouse/provider/accessories_provider.dart';
import 'package:app_warehouse/provider/cart_provider.dart';
import 'package:app_warehouse/provider/combo_item_provider.dart';
import 'package:app_warehouse/provider/keep_rental_few_provider.dart';
import 'package:app_warehouse/provider/keep_rental_much_provider.dart';
import 'package:app_warehouse/provider/order_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
       
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => ComboItemProdiver(),
        ),
        ChangeNotifierProvider(
          create: (context) => BoxFew(),
        ),
        ChangeNotifierProvider(
          create: (context) => BoxMuch(),
        ),
        ChangeNotifierProvider(
          create: (context) => Accessories(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
          theme: ThemeData(fontFamily: 'Helvetica'), home: LogInScreen()),
    );
  }
}
