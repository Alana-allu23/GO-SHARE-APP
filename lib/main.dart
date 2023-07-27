import 'package:corider/Login/splash.dart';
import 'package:flutter/material.dart';

import 'Login/first_page.dart';
import 'Login/login.dart';
import 'Police module/police_home.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splash(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.white,
      ),
    );
  }
}
