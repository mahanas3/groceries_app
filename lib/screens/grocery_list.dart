import 'package:flutter/material.dart';
import 'package:groceries_app/screens/grocery_provider.dart';
import 'package:groceries_app/screens/items.dart';
import 'package:provider/provider.dart';

class Groceries extends StatefulWidget {
  const Groceries({super.key});

  @override
  State<Groceries> createState() => _GroceriesState();
}

class _GroceriesState extends State<Groceries> {
  List groceries = [
    'mahanas',
    'mirfa',
    'gayathri',
    'aswathi',
    'apple',
    'grapes',
    'orange'
  ];

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text('Groceries',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 150, top: 10),
            child: Row(
              children: [
                const Text('Items',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    )),
                const SizedBox(
                  width: 8,
                ),
                Text(context.watch<GroceryProvider>().item.length.toString(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.separated(
              itemCount: groceries.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(groceries[index].toString()),
                  subtitle: Consumer<GroceryProvider>(
                    builder: (BuildContext context, value, Widget? child) {
                      return Checkbox(
                          activeColor: Colors.black87,
                          value: isChecked,
                          onChanged: (bool? value) {
                            isChecked = value!;
                            context
                                .read<GroceryProvider>()
                                .addGroceries(context, groceries[index]);
                          });
                    },
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blueGrey,
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const Items()));
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
