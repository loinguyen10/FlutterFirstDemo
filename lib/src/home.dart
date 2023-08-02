import 'package:flutter/material.dart';
import 'package:flutterdemojava/app/button.dart';
import 'package:flutterdemojava/src/add.dart';
import 'dart:convert';
// import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  List<ListItem> items = [
    ListItem(id: 1, name: "C.Ronaldo", age: 25, gender: "male", price: 10.99),
    ListItem(id: 2, name: "A.Morgan", age: 30, gender: "female", price: 15.49),
    ListItem(id: 3, name: "L.Messi", age: 22, gender: "male", price: 10.75),
  ];

  String _listToJson() {
    List<Map<String, dynamic>> jsonList =
        items.map((item) => item.toJson()).toList();
    return json.encode(jsonList);
  }

  void _listFromJson(String jsonStr) {
    List<Map<String, dynamic>> jsonList = json.decode(jsonStr);
    items = jsonList.map((jsonItem) => ListItem.fromJson(jsonItem)).toList();
  }

  void _saveData() async {
    String jsonStr = _listToJson();
    print(jsonStr);
  }

  void _loadData() async {
    String jsonStr = '';
    _listFromJson(jsonStr);
  }

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
      AppButton(text: "Save", onPressed: () => _saveData()),
      AppButton(text: "Load", onPressed: () => _loadData()),
      DataTable(
        columns: [
          DataColumn(label: Text("Id")),
          DataColumn(label: Text("Name")),
          DataColumn(label: Text("Age")),
          DataColumn(label: Text("Gender")),
          DataColumn(label: Text("Price")),
        ],
        rows: List.generate(items.length, (index) {
          final item = items[index];
          return DataRow(
            cells: [
              DataCell(Text(item.id.toString())),
              DataCell(Text(item.name)),
              DataCell(Text(item.age.toString())),
              DataCell(Text(item.gender)),
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
  final String name, gender;
  final int age;
  final double price;

  ListItem(
      {required this.id,
      required this.name,
      required this.age,
      required this.gender,
      required this.price});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'gender': gender,
      'price': price,
    };
  }

  factory ListItem.fromJson(Map<String, dynamic> json) {
    return ListItem(
      id: json['id'],
      name: json['name'],
      age: json['age'],
      gender: json['gender'],
      price: json['price'],
    );
  }
}
