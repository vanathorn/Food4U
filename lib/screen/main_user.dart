import 'package:flutter/material.dart';
//import 'package:food4u/utility/myservice.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:food4u/utility/signOut.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainUser extends StatefulWidget {
  @override
  _MainUserState createState() => _MainUserState();
}

class _MainUserState extends State<MainUser> {
  String loginName;

  @override
  void initState() {
    super.initState();
    findUser();
  }

  Future<Null> findUser() async {
    SharedPreferences prefer = await SharedPreferences.getInstance();
    setState(() {
      loginName = prefer.getString('pname');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primarycolor,
        title: MyStyle().txtTH(
            loginName == null ? 'Main User' : 'login $loginName', Colors.white),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              iconSize: 38,
              onPressed: () => signOut(context) //
              )
        ],
      ),
      drawer: buildDrawer('Wellcome', loginName, 'user.jpg'),
      body: Center(
          //
      ),
    );
  }

  Drawer buildDrawer(name, email, imgwall) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              MyStyle().builderUserAccountsDrawerHeader(name, email, imgwall),
              //buildSignUp(),
            ],
          ),
          //buildSignout(),
        ],
      ),
    );
  }

}

