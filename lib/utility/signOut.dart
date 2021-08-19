import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food4u/screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<Null> signOut(BuildContext context) async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    prefer.clear();
    //exit(0);
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) =>  Home(),
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
}
  