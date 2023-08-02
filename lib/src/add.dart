import 'package:flutter/material.dart';
import 'package:flutterdemojava/src/home.dart';
// import 'package:flutterdemojava/src/third.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

TextEditingController txtId = TextEditingController();
TextEditingController txtName = TextEditingController();
TextEditingController txtAge = TextEditingController();
TextEditingController txtPrice = TextEditingController();

class addScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new addS();
  }
}

class addS extends State<addScreen> {
  final List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Id"),
            TextField(
              controller: txtId,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name"),
            TextField(
              controller: txtName,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Age"),
            TextField(
              controller: txtAge,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),

        //
        FittedBox(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              hint: Text(
                'Select Item',
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).hintColor,
                ),
              ),
              items: items
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ))
                  .toList(),
              value: selectedValue,
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                });
              },
              buttonStyleData: const ButtonStyleData(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                width: 140,
              ),
              menuItemStyleData: const MenuItemStyleData(
                height: 40,
              ),
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Price"),
            TextField(
              controller: txtPrice,
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

void _sendDataToSecondScreen(BuildContext context) {
  int textId = txtId.text as int;
  String textName = txtName.text;
  double textPrice = txtPrice.text as double;
  int textAge = txtAge.text as int;

  ListItem newitem =
      ListItem(id: textId, name: textName, age: textAge, price: textPrice);
}
