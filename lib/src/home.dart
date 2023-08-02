// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterdemojava/app/button.dart';
import 'package:flutterdemojava/src/add.dart';
// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  List<ListItem> items = [
    ListItem(id: 1, name: "Item 1", age: 25, price: 10.99),
    ListItem(id: 2, name: "Item 2", age: 30, price: 15.49),
    ListItem(id: 3, name: "Item 3", age: 22, price: 8.75),
  ];

  // @override
  // void initState() {
  //   super.initState();
  //   fetchItems();
  // }

  // Future<void> fetchItems() async {
  //   final response = await http
  //       .get(Uri.parse('https://lmatmet1234.000webhostapp.com/api_select.php'));

  //   if (response.statusCode == 200) {
  //     List<dynamic> jsonData = json.decode(response.body);
  //     setState(() {
  //       items = jsonData.map((item) => ListItem.fromJson(item)).toList();
  //     });
  //   } else {
  //     print('Failed to load data');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      AppButton(
        text: "Add",
        onPressed: () => showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text('Add Human'),
            content: addScreen(),
            actions: <Widget>[
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text('Cancel'),
              ),
            ],
          ),
        ),
      ),
      DataTable(
        columns: [
          DataColumn(label: Text("Id")),
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Age")),
          DataColumn(label: Text("Price")),
        ],
        rows: List.generate(items.length, (index) {
          final item = items[index];
          return DataRow(
            cells: [
              DataCell(Text(item.id.toString())),
              DataCell(Text(item.name)),
              DataCell(Text(item.age.toString())),
              DataCell(Text(item.price.toString())),
            ],
          );
        }),
      )
    ]);
  }
}

class ListItem {
  final int id;
  final String name;
  final int age;
  final double price;

  ListItem(
      {required this.id,
      required this.name,
      required this.age,
      required this.price});

  // factory ListItem.fromJson(Map<String, dynamic> json) {
  //   return ListItem(
  //     id: json['id'],
  //     name: json['name'],
  //     age: json['age'],
  //     price: json['price'].toDouble(),
  //   );
  // }
}
