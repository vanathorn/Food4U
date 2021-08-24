import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food4u/model/login_model.dart';
import 'package:food4u/utility/dialig.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'my_constant.dart';

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

  Future<String> findStrConn(BuildContext context) async {
    String mystrConn;         
    SharedPreferences prefer = await SharedPreferences.getInstance();
    String loginMobile = prefer.getString('pmobile');
    String url = '${MyConstant().domain}/F4uApi/checkMobile.aspx?Mobile=' + loginMobile;
    try {
      Response response = await Dio().get(url);
      if (response.toString().trim() == '') {
        alertDialog(context, '!มือถือไม่ถูกต้อง');
        //mystrConn='err_mobile';
      } else {
        var result = json.decode(response.data);
        for (var map in result) {
          LoginModel loginmodel = LoginModel.fromJson(map);
          if (loginMobile == loginmodel.mobile) {
            mystrConn =  loginmodel.strconn;
          }else{
            alertDialog(context, '!ข้อมูลไม่ถูกต้อง');
            //mystrConn='err_data';
            break;
          }
        }
      } 
    } catch (e) {
      //mystrConn='err_server';
      alertDialog(context, '!ไม่สามารถติดต่อ Serverได้');
    }  
    return mystrConn;  
  }
  
}
                       

