import 'package:flutter/material.dart';
import 'package:food4u/screen/SignIn.dart';
import 'package:food4u/screen/SingUp.dart';
import 'package:food4u/screen/main_rider.dart';
import 'package:food4u/screen/main_shop.dart';
import 'package:food4u/screen/main_user.dart';
import 'package:food4u/utility/dialig.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:food4u/utility/myutil.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String name, email, imgwall;
  //Widget currentwidget = MyUtil().buildSignIn();

  @override
  void initState() {
    super.initState();
    checkPreferance();
  }

  Future<Null> checkPreferance() async {
    try {
      SharedPreferences prefer = await SharedPreferences.getInstance();
      String chooseType = prefer.getString('pchooseType');
      if (chooseType != null && chooseType.isNotEmpty) {
        if (chooseType == 'User') {
          routeToService(MainUser());
        } else if (chooseType == 'Rider') {
          routeToService(MainRider());
        } else if (chooseType == 'Shop') {
          routeToService(MainShop());
        } else {
          alertDialog(context, '!ประเภทผู้ใช้งานไม่ถูกต้อง');
        }
      }
    } catch (e) {
      //
    }
  }

  void routeToService(Widget myWidget) {
    MaterialPageRoute route = MaterialPageRoute(
      builder: (context) => myWidget,
    );
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyStyle().primarycolor,
      ),
      drawer: buildHomeDrawer('Wellcome', 'Guest', 'guest.jpg'),
      body: Center(
        child: MyStyle().txtbrand('Food4U'),
      ),
    );
  }

  Drawer buildHomeDrawer(name, email, imgwall) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              MyStyle().builderUserAccountsDrawerHeader(name, email, imgwall),
              buildSignIn(),
              buildSignUp(),
            ],
          ),
          //buildSignout(),
        ],
      ),
    );
  }

  ListTile buildSignIn() {
    return ListTile(
      leading: Icon(
        Icons.login,
        size: 36,
      ),
      title: MyStyle().titleDark('เข้าใช้ระบบ'),
      subtitle: MyStyle().subtitleDark('Signin with your exist account.'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignIn());
        Navigator.push(context, route);
      },
    );
  }

  ListTile buildSignUp() {
    return ListTile(
      leading: Icon(
        Icons.app_registration,
        size: 36,
      ),
      title: MyStyle().titleDark('สมัครสมาชิกใหม่'),
      subtitle: MyStyle().subtitleDark('New register.'),
      onTap: () {
        Navigator.pop(context);
        MaterialPageRoute route =
            MaterialPageRoute(builder: (value) => SignUp());
        Navigator.push(context, route);
      },
    );
  }
}
