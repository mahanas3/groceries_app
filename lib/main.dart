import 'package:flutter/material.dart';
import 'package:groceries_app/screens/grocery_list.dart';
import 'package:groceries_app/screens/grocery_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp((ChangeNotifierProvider(
      create: (context) => GroceryProvider(), child: const Main())));
  }

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Groceries(),
    );
  }
}
