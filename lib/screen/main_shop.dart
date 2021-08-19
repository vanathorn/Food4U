import 'package:flutter/material.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:food4u/utility/signOut.dart';
import 'package:food4u/widget/shop_food_menu.dart';
import 'package:food4u/widget/shop_info.dart';
import 'package:food4u/widget/shop_order_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainShop extends StatefulWidget {
  @override
  _MainShopState createState() => _MainShopState();
}

class _MainShopState extends State<MainShop> {
  String loginName;
  Widget currentWidget = ShopOrderList();

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
            loginName == null ? 'Main Shop' : 'login $loginName', Colors.white),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.exit_to_app),
              iconSize: 38,
              onPressed: () => signOut(context) //
              )
        ],
      ),
      drawer: buildDrawer('Wellcome', loginName, 'shop.jpg'),
      body: currentWidget,
    );
  }

  Drawer buildDrawer(name, email, imgwall) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          Column(
            children: [
              MyStyle().builderUserAccountsDrawerHeader(name, email, imgwall),
              shopHomemenu(),
              shopFoodmenu(),
              shopInfoMenu(),
              signOutMenu(),
            ],
          ),
          //buildSignout(),
        ],
      ),
    );
  }

  ListTile shopHomemenu() => ListTile(
        leading: Icon(Icons.home),
        title: MyStyle().titleDark('รายการที่ลูกค้าสั่ง'),
        subtitle: MyStyle().subtitleDark('ยังไม่ได้ทำส่งลูกค้า'),
        onTap: () {
          setState(() {
            currentWidget = ShopOrderList();
          });
          Navigator.pop(context);
        },
      );

  ListTile shopFoodmenu() => ListTile(
        leading: Icon(Icons.fastfood),
        title: MyStyle().titleDark('รายการอาหาร'),
        subtitle: MyStyle().subtitleDark('List of food in  my shop.'),
        onTap: () {
          setState(() {
            currentWidget =  ShopFoodMenu();
          });
          Navigator.pop(context);
        },
      );

  ListTile shopInfoMenu() => ListTile(
        leading: Icon(Icons.info),
        title: MyStyle().titleDark('รายละเอียดของร้าน'),
        subtitle: MyStyle().subtitleDark('Detail of Shop.'),
        onTap: () {
          setState(() {
            currentWidget = ShopInfo();
          });
          Navigator.pop(context);
        },
      );

  ListTile signOutMenu() => ListTile(
        leading: Icon(Icons.exit_to_app),
        title: MyStyle().titleDark('ออกจากระบบ'),
        subtitle: MyStyle().subtitleDark('Back to home page.'),
        onTap: () => signOut(context),
      );
}
