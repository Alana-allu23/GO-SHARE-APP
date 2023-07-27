// import 'package:flutter/material.dart';

// class dialog extends StatefulWidget {
//   const dialog({super.key});

//   @override
//   State<dialog> createState() => _dialogState();
// }

// class _dialogState extends State<dialog> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Log out'),
//         backgroundColor: Color.fromARGB(255, 154, 156, 154),
//         foregroundColor: Color.fromARGB(255, 255, 254, 254),
//         leading: InkWell(
//             onTap: () {
//               Navigator.pop(context);
//             },
//             child: Icon(Icons.arrow_back_ios)),
//       ),
//       body: SafeArea(
//           child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Center(
//               child: AlertDialog(
//             title: Text("Success"),
//             titleTextStyle: TextStyle(
//                 fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
//             actionsOverflowButtonSpacing: 20,
//             actions: [
//               ElevatedButton(onPressed: () {}, child: Text("Back")),
//               ElevatedButton(onPressed: () {}, child: Text("Next")),
//             ],
//             content: Text("Saved successfully"),
//           )),
//         ],
//       )),
//     );
//   }
// }
