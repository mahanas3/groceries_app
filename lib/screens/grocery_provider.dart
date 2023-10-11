import 'package:flutter/material.dart';
import 'package:groceries_app/screens/items.dart';

class GroceryProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> item = [];

  void addGroceries(BuildContext context, String name) {
    item.add({'name': name, 'checkbox': Checkbox});
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Items()));
    notifyListeners();
  }
}
