import 'package:flutter/material.dart';
// import 'package:flutterdemojava/src/add.dart';
import 'package:flutterdemojava/src/home.dart';
// import 'package:flutterdemojava/src/second.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

// class myMain extends StatelessWidget {
// //   final String title;
// //   final String word;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text("Hello"),
//         ),
//         body: Center(
//           child: Column(
//             children: [
//               Text("Hello world"),
//               Text("Blank Text"),
//               OutlinedButton(
//                   onPressed: () => {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => addScreen()))
//                       },
//                   child: Text("Next")),
//             ],
//           ),
//         ));
//   }
// }
