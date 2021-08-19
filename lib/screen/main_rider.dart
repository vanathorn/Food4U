import 'package:flutter/material.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:food4u/utility/signOut.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainRider extends StatefulWidget {
  @override
  _MainRiderState createState() => _MainRiderState();
}

class _MainRiderState extends State<MainRider> {
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
      drawer: buildDrawer('Wellcome', loginName, 'rider.jpg'),
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
