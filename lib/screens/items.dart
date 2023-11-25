import 'package:flutter/material.dart';
import 'package:groceries_app/screens/grocery_provider.dart';
import 'package:provider/provider.dart';

class Items extends StatefulWidget {
  const Items({super.key});

  @override
  State<Items> createState() => _ItemsState();
}

class _ItemsState extends State<Items> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemCount: context.read<GroceryProvider>().item.length,
        itemBuilder: (BuildContext context, int index) {
          return  ListTile(
            title: Text(context.read<GroceryProvider>().item[index]['name'])
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(
          color: Colors.black,
        ),
      ),
    );
  }
}
