import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:food4u/model/user_model.dart';
import 'package:food4u/screen/main_rider.dart';
import 'package:food4u/screen/main_shop.dart';
import 'package:food4u/screen/main_user.dart';
import 'package:food4u/utility/mystyle.dart';
import 'package:food4u/utility/myutil.dart';
import 'package:food4u/utility/dialig.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  double screen;
  bool redeye = true;
  String mobile, password;

  @override
  Widget build(BuildContext context) {
    screen = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
          backgroundColor: MyStyle().primarycolor,
          title:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            MyStyle().titleLight('หน้าหลัก'),
            Container(
              child: MyStyle().txtstyle('เข้าใช้ระบบ', Color(0xff0a0a77), 18),
              padding: EdgeInsetsDirectional.only(top: 0),
            )
          ])),
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
              center: Alignment(0, -0.33),
              radius: 1.0,
              colors: <Color>[Colors.white, MyStyle().lightcolor]),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                buildLogo(),
                MyStyle().txtbrand('Food4U'),
                buildMobile(),
                buildPassword(),
                buildLogin(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: buildRegister(),
    );
  }

  Container buildLogo() {
    return Container(width: screen * 0.25, child: MyUtil().showLogo());
  }

  Container buildMobile() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      margin: EdgeInsets.only(top: 5),
      width: screen * 0.75,
      child: TextField(
        keyboardType: TextInputType.number,
        onChanged: (value) => mobile = value.trim(),
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().hintcolor),
          hintText: 'มือถือ',
          prefixIcon: Icon(Icons.person, color: MyStyle().darkcolor),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().lightcolor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().darkcolor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        cursorColor: Color(0xffffffff),
        style: GoogleFonts.kanit(
            fontStyle: FontStyle.normal,
            fontSize: 22,
            fontWeight: FontWeight.normal,
            color: Color(0xff000000)),
      ),
    );
  }

  Container buildPassword() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white70,
      ),
      margin: EdgeInsets.only(top: 10),
      width: screen * 0.75,
      child: TextField(
        onChanged: (value) => password = value.trim(),
        obscureText: redeye,
        decoration: InputDecoration(
          hintStyle: TextStyle(color: MyStyle().hintcolor),
          hintText: 'รหัส',
          prefixIcon: Icon(Icons.lock, color: MyStyle().darkcolor),
          suffixIcon: IconButton(
            icon: redeye
                ? Icon(Icons.remove_red_eye)
                : Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              setState(() {
                redeye = !redeye;
              });
            },
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: MyStyle().lightcolor),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: MyStyle().darkcolor),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        cursorColor: Color(0xffffffff),
        style: GoogleFonts.kanit(
            fontStyle: FontStyle.normal,
            fontSize: 22,
            fontWeight: FontWeight.normal,
            color: Color(0xff000000)),
      ),
    );
  }

  Container buildLogin() {
    return Container(
        margin: EdgeInsets.only(top: 10),
        width: screen * 0.75,
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            if ((mobile?.isEmpty ?? true) || (password?.isEmpty ?? true)) {
              alertDialog(context, 'มือถือ และ รหัสห้ามเป็นช่องว่าง');
            } else {
              checkAuthen();
            }
          },
          child: MyStyle().titleLight('เข้าระบบ'),
          style: ElevatedButton.styleFrom(
              primary: MyStyle().darkcolor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
        ));
  }

  TextButton buildRegister() => TextButton(
        onPressed: () => Navigator.pushNamed(context, '/signup'),
        child: Text(
          'สมัครใหม่',
          style: GoogleFonts.kanit(
              fontStyle: FontStyle.normal,
              fontSize: 22,
              fontWeight: FontWeight.normal,
              color: MyStyle().blackcolor),
        ),
      );

  Future<Null> checkAuthen() async {
    String url = 'http://27.254.206.234/F4uApi/checkLogin.aspx?Mobile=' +
        mobile +
        '&Psw=' +
        password;
    try {
      Response response = await Dio().get(url);
      //print('res = $response');
      if (response.toString().trim() == '') {
        alertDialog(context, '!มือถือ หรือ รหัสไม่ถูกต้อง');
      } else {
        var result = json.decode(response.data);
        print('result = $result');
        for (var map in result) {
          UserModel usermodel = UserModel.fromJson(map);
          //print('usermodel = $usermodel');
          if (mobile == usermodel.mobile && password == usermodel.psw) {
            String chooseType = usermodel.mbtname;
            print('chooseType = $chooseType');
            if (chooseType=='User'){
              routeToService(MainUser(), usermodel);
            }else if (chooseType=='Rider'){
              routeToService(MainRider(), usermodel);
            }else if (chooseType=='Shop'){
              routeToService(MainShop(), usermodel);
            }else{
              alertDialog(context, '!ประเภทผู้ใช้งานไม่ถูกต้อง');
            }
          } else {
            alertDialog(context, '!ข้อมูลไม่ถูกต้อง');
          }
        }
        //Navigator.pop(context);
      }
    } catch (e) {
      alertDialog(context, '!ไม่สามารถติดต่อ Serverได้');
    }
  }

  Future<Null> routeToService(Widget myWidget, UserModel userModel) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('pid', userModel.mbid);
    prefs.setString('pchooseType', userModel.mbtname);
    prefs.setString('pname', userModel.mbname);

    MaterialPageRoute route = MaterialPageRoute(builder: (context) => myWidget,);
    Navigator.pushAndRemoveUntil(context, route, (route) => false);
  }
}
