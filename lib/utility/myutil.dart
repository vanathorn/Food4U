import 'package:flutter/material.dart';
import 'package:food4u/utility/mystyle.dart';

class MyUtil {
  Widget showLogo() => Image.asset('images/logo.png');

  Drawer buildHomeDrawer(name, email) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              builderUserAccountsDrawerHeader(name, email),
              //buildSignIn(),
              //buildSignUp(),
            ],
          ),
          //buildSignout(),
        ],
      ),
    );
  }

  UserAccountsDrawerHeader builderUserAccountsDrawerHeader(name, email) {
    return UserAccountsDrawerHeader(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/wall.jpg'), fit: BoxFit.cover)),
      accountName: MyStyle().titleDrawer(email == null ? 'email' : email),
      accountEmail: MyStyle().subtitleDrawer(name == null ? 'Name' : name),
      //***** name คือ email  Email คือ  user  *****
      currentAccountPicture: Image.asset('images/logo.png'),
    );
  }
                       
}
