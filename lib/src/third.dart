import 'package:flutter/material.dart';
import 'package:flutterdemojava/src/second.dart';

class thirdPage extends StatelessWidget {
  final String text;
  const thirdPage({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: myHome(
        text: text,
      ),
    );
  }
}

class myHome extends StatelessWidget {
  final String text;
  const myHome({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hello 3rd"),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 24),
              ),
              OutlinedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => secondPage()))
                      },
                  child: Text("Back 2nd")),
            ],
          ),
        ));
  }
}
