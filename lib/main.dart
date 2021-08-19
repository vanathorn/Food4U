import 'package:flutter/material.dart';
import 'package:food4u/router.dart';

String initialRoute = '/home';
Future<Null> main() async {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //theme: ThemeData(primarySwatch: Colors.lightBlue),
      routes: routes,
       initialRoute: initialRoute,
    );
  }
}