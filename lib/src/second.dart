import 'package:flutter/material.dart';
import 'package:flutterdemojava/app/button.dart';
// import 'package:flutterdemojava/main.dart';
import 'package:flutterdemojava/src/third.dart';

int number = 0;
TextEditingController textFieldController = TextEditingController();

class secondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: myHome(),
    );
  }
}

class myHome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new addNumber();
  }
}

class addNumber extends State<myHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello 2nd"),
        ),
        body: Center(
          child: Column(
            children: [
              Text("Hello there"),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: TextField(
                  controller: textFieldController,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              Text("Number is: $number"),
              ElevatedButton.icon(
                icon: Icon(Icons.add, size: 40),
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () => {
                  setState(
                    () => number++,
                  )
                },
                label: Text("Add"),
              ),
              AppButton(
                text: "Remove",
                onPressed: () => setState(
                  () => number--,
                ),
                marginValue: 16.0,
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
              OutlinedButton(
                  onPressed: () => {
                        // Navigator.push(context,
                        //     MaterialPageRoute(builder: (context) => myMain())),
                      },
                  child: Text("Back")),
              OutlinedButton(
                  onPressed: () => {
                        _sendDataToSecondScreen(context),
                      },
                  child: Text("Next 3rd")),
            ],
          ),
        ));
  }
}

void _sendDataToSecondScreen(BuildContext context) {
  String textToSend = textFieldController.text;
  Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => thirdPage(
          text: textToSend,
        ),
      ));
}
