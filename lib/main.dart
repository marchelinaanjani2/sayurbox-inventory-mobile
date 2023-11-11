import 'package:flutter/material.dart';
import 'package:sayurbox_inventory/screens/menu.dart';
import 'package:sayurbox_inventory/widgets/product_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 63, 181, 169)),
        useMaterial3: true,
      ),
      home: MyHomePage(products: []),
    );
  }
}
